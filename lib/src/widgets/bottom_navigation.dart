import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:sizer/sizer.dart';

typedef SetIndex = void Function(int index);
SalomonBottomBar buildBottomBar(int currentIndex, SetIndex onTap) {
  return SalomonBottomBar(
      currentIndex: currentIndex,
      onTap: onTap,
      unselectedItemColor: Colors.black,
      selectedItemColor: Colors.red,
      items: [
        SalomonBottomBarItem(
          icon: Icon(
            CupertinoIcons.home,
            size: 24.sp,
          ),
          title: const Text("Home"),
        ),
        SalomonBottomBarItem(
          icon: Icon(
            CupertinoIcons.calendar,
            size: 24.sp,
          ),
          title: const Text("Scan History"),
        ),
        SalomonBottomBarItem(
          icon: Icon(
            CupertinoIcons.person,
            size: 24.sp,
          ),
          title: const Text("Profile"),
        ),
      ]);
}
