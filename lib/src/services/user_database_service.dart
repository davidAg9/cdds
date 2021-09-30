import 'package:cdds/src/model/drug.dart';
import 'package:cdds/src/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class UserDatabaseInterface {
  Future<CDDSUSER> saveUser(CDDSUSER user);
  Future<CDDSUSER?> getuser(String id);
  Future<CDDSUSER> updateUser(CDDSUSER user);
  Future<void> addScannedDrugfor(String userId, Drug drug);
}

class UserDatabaseService extends UserDatabaseInterface {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  @override
  Future<void> addScannedDrugfor(String userId, Drug drug) async {
    await users.doc(userId).update({
      "scannedDrugs": FieldValue.arrayUnion([drug.toDocument()])
    });
  }

  @override
  Future<CDDSUSER?> getuser(String id) async {
    final result = await users.doc(id).get(const GetOptions());
    if (result.exists) {
      final map = result.data() as Map<String, dynamic>?;
      return CDDSUSER.fromDocument(map!);
    } else {
      return null;
    }
  }

  @override
  Future<CDDSUSER> saveUser(CDDSUSER user) async {
    await users.doc(user.id).set(user.toDocument());
    return user;
  }

  @override
  Future<CDDSUSER> updateUser(CDDSUSER user) async {
    await users.doc(user.id).update(user.toDocument());
    return user;
  }
}
