import 'package:cdds/injection.dart';
import 'package:cdds/src/model/user.dart';
import 'package:cdds/src/registration/bloc/registration_bloc.dart';
import 'package:cdds/src/widgets/loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);
  static const String routeName = "/";
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegistrationBloc>(
      create: (context) => dp(),
      child: Scaffold(
          body: BlocConsumer<RegistrationBloc, RegistrationState>(
        listener: (context, state) {
          if (state is SignedState) {
            Navigator.restorablePushNamed(
              context,
              "/home",
              arguments: state.user,
            );
          } else if (state is RegistrationError) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Colors.white,
                content: Text(
                  "Could Not Sign In,Try Again",
                  style: TextStyle(color: Colors.redAccent),
                )));
          }
        },
        builder: (context, state) {
          if (state is RegistrationInitial) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                CircleAvatar(
                  radius: 60.sp,
                  backgroundImage: const AssetImage("assets/images/cddslogo.jpeg"),
                ),
                const Spacer(),
                const Text(
                  "Welcome ",
                  style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.redAccent),
                ),
                const Spacer(),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.grey[100]),
                    elevation: MaterialStateProperty.all(2),
                    fixedSize: MaterialStateProperty.all(Size(50.w, 6.h)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(
                          width: .5.w,
                          color: Colors.red.shade200,
                        ),
                      ),
                    ),
                  ),
                  child: Text(
                    "Scan Drug",
                    style:
                        TextStyle(letterSpacing: 3, fontWeight: FontWeight.bold, fontSize: 14.sp),
                  ),
                  onPressed: () {
                    // context.read<RegistrationBloc>().add(const CddsSignInAnonymous());
                    Navigator.pushNamed(
                      context,
                      "/home",
                      arguments: const CDDSUSER(id: "id", email: "Sam@someth.com").toDocument(),
                    );
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 2.h, top: 5.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        color: Colors.grey[300],
                        child: Divider(
                          indent: 20.w,
                          endIndent: 20.w,
                          height: .3.h,
                        ),
                      ),
                      Text(
                        "OR",
                        style: TextStyle(fontSize: 10, color: Colors.grey[300]),
                      ),
                      Container(
                        color: Colors.grey[300],
                        child: Divider(
                          indent: 20.w,
                          endIndent: 20.w,
                          height: .3.h,
                          thickness: 10.sp,
                        ),
                      )
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<RegistrationBloc>().add(CddsSignInApple());
                  },
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(FontAwesomeIcons.apple),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "Sign In With Apple",
                        style: TextStyle(fontSize: 12.sp),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<RegistrationBloc>().add(CddsSignInGoogle());
                  },
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white70)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        FontAwesomeIcons.google,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "Sign In With Google",
                        style: TextStyle(fontSize: 12.sp, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                const Spacer()
              ],
            );
          } else if (state is RegistrationSigning) {
            return const CDDSLoadingWidget();
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                CircleAvatar(
                  radius: 60.sp,
                  backgroundImage: const AssetImage("assets/images/cddslogo.jpeg"),
                ),
                const Spacer(),
                const Text(
                  "Welcome ",
                  style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.redAccent),
                ),
                const Spacer(),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.grey[100]),
                    elevation: MaterialStateProperty.all(2),
                    fixedSize: MaterialStateProperty.all(Size(50.w, 6.h)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(
                          width: .5.w,
                          color: Colors.red.shade200,
                        ),
                      ),
                    ),
                  ),
                  child: Text(
                    "Scan Drug",
                    style:
                        TextStyle(letterSpacing: 3, fontWeight: FontWeight.bold, fontSize: 14.sp),
                  ),
                  onPressed: () {},
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 2.h, top: 5.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        color: Colors.grey[300],
                        child: Divider(
                          indent: 20.w,
                          endIndent: 20.w,
                          height: .3.h,
                        ),
                      ),
                      Text(
                        "OR",
                        style: TextStyle(fontSize: 10, color: Colors.grey[300]),
                      ),
                      Container(
                        color: Colors.grey[300],
                        child: Divider(
                          indent: 20.w,
                          endIndent: 20.w,
                          height: .3.h,
                          thickness: 10.sp,
                        ),
                      )
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(FontAwesomeIcons.apple),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "Sign In With Apple",
                        style: TextStyle(fontSize: 12.sp),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white70)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        FontAwesomeIcons.google,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "Sign In With Google",
                        style: TextStyle(fontSize: 12.sp, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                const Spacer()
              ],
            );
          }
        },
      )),
    );
  }
}
