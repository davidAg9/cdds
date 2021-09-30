import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sizer/sizer.dart';

class CDDSLoadingWidget extends StatefulWidget {
  const CDDSLoadingWidget({Key? key}) : super(key: key);

  @override
  State<CDDSLoadingWidget> createState() => _CDDSLoadingWidgetState();
}

class _CDDSLoadingWidgetState extends State<CDDSLoadingWidget> with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  @override
  Widget build(BuildContext context) {
    _controller ??= AnimationController(vsync: this, duration: const Duration(milliseconds: 1200));

    return SizedBox(
      height: 100.h,
      width: 100.w,
      child: SpinKitCubeGrid(
        size: 50.0,
        itemBuilder: (BuildContext context, int index) {
          return const DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
          );
        },
        controller: _controller,
      ),
    );
  }
}
