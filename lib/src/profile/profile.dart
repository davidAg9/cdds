import 'package:cdds/src/model/user.dart';
import 'package:cdds/src/profile/profile_widgets.dart';
import 'package:cdds/src/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  final CDDSUSER user;
  const ProfileView({Key? key, required this.user}) : super(key: key);

  static const String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            name: user.name ?? "",
            isEdit: true,
            onClicked: () async {},
          ),
          const SizedBox(height: 24),
          TextFieldWidget(
            label: 'Full Name',
            text: user.name ?? "enter name ",
            onChanged: (name) {},
          ),
          const SizedBox(height: 24),
          TextFieldWidget(
            label: 'Email',
            text: user.email ?? "add email",
            onChanged: (email) {},
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

String buildNameInitials(String? username) {
  final names = username?.split(" ");

  return "${names?[0].characters.first.toUpperCase()}${names?[1].characters.first.toUpperCase()}";
}
