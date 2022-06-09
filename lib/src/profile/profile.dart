import 'package:cdds/src/model/user.dart';
import 'package:cdds/src/profile/profile_widgets.dart';
import 'package:cdds/src/settings/settings_view.dart';
import 'package:cdds/src/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProfileView extends StatelessWidget {
  final CDDSUSER user;
  const ProfileView({Key? key, required this.user}) : super(key: key);

  static const String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.redAccent,
            ),
            onPressed: () {
              // Navigate to the settings page. If the user leaves and returns
              // to the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const Spacer(),
            ProfileWidget(
              name: user.name,
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
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.redAccent)),
              child: Text(
                "Save",
                style: TextStyle(fontSize: 12.sp, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String buildNameInitials(String? username) {
  final names = username?.split(" ");
  if (names != null) {
    return "${names[0].characters.first.toUpperCase()}${names[1].characters.first.toUpperCase()}";
  } else {
    return "OO";
  }
}
