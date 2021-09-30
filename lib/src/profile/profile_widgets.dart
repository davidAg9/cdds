import 'package:cdds/src/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProfileWidget extends StatelessWidget {
  final String name;
  final bool isEdit;
  final VoidCallback onClicked;

  const ProfileWidget({
    Key? key,
    required this.name,
    this.isEdit = false,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: buildImage(),
    );
  }

  Widget buildImage() {
    return CircleAvatar(
      radius: 40.sp,
      backgroundColor: Colors.red,
      child: Text(
        buildNameInitials(name),
        style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildEditIcon(Color color) => buildCircle(
        color: Colors.white,
        all: 3,
        child: buildCircle(
          color: color,
          all: 8,
          child: Icon(
            isEdit ? Icons.add_a_photo : Icons.edit,
            color: Colors.white,
            size: 20,
          ),
        ),
      );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}
