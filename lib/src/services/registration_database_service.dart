import 'dart:convert';
import 'dart:developer';
import 'dart:math' as math;

import 'package:cdds/src/model/user.dart';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

abstract class RegistrationDatabaseInterface {
  Future<CDDSUSER> signInAnonymously();
  Future<CDDSUSER> signInGoogly();
  Future<CDDSUSER> signInApplely();
}

class RegistrationDatabaseService implements RegistrationDatabaseInterface {
  final authInstance = FirebaseAuth.instance;

  @override
  Future<CDDSUSER> signInAnonymously() async {
    final credential = await authInstance.signInAnonymously();
    return CDDSUSER(id: credential.user!.uid, email: null);
  }

  @override
  Future<CDDSUSER> signInApplely() async {
    final rawNonce = _generateNonce();
    final nonce = _sha256ofString(rawNonce);

    // Request credential for the currently signed in Apple account.
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: nonce,
    );
    final email = appleCredential.email;
    final fname = appleCredential.givenName;
    final lname = appleCredential.familyName;
    // Create an `OAuthCredential` from the credential returned by Apple.
    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: appleCredential.identityToken,
      rawNonce: rawNonce,
    );

    log("email logged is : $email");
    log("name logged is : $fname $lname");
    // Sign in the user with Firebase. If the nonce we generated earlier does
    // not match the nonce in `appleCredential.identityToken`, sign in will fail.
    final userCredential = await FirebaseAuth.instance.signInWithCredential(oauthCredential);
    return CDDSUSER(id: userCredential.user!.uid, email: email, name: "$fname $lname");
  }

  @override
  Future<CDDSUSER> signInGoogly() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    final userCredentials = await authInstance.signInWithCredential(credential);
    return CDDSUSER(
        id: userCredentials.user!.uid,
        email: userCredentials.user?.email,
        name: userCredentials.user!.displayName);
  }

  String _generateNonce([int length = 32]) {
    const charset = '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = math.Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)]).join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String _sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
}
