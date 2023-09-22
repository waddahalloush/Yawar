import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Constants {
  static void showAwesomeSuccessSnack({
    required BuildContext context,
    required String msg,
  }) {
    AnimatedSnackBar.material(
      msg,
      snackBarStrategy: RemoveSnackBarStrategy(),
      type: AnimatedSnackBarType.success,
    ).show(context);
  }

  static void showAwesomeErrorSnack({
    required BuildContext context,
    required String msg,
  }) {
    AnimatedSnackBar.material(
      msg,
      snackBarStrategy: RemoveSnackBarStrategy(),
      type: AnimatedSnackBarType.error,
    ).show(context);
  }

  static Widget onLoading() {
    return const FittedBox(
      child: SpinKitFadingFour(
        color: Color.fromARGB(255, 140, 133, 222),
        size: 15,
      ),
    );
  }

  static Widget emptyListView({
    required String img,
    required String text,
  }) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(img, width: 300.h, fit: BoxFit.cover),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              text,
              style: TextStyle(
                  color: const Color(0xffFFA016),
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Cairo'),
            ),
          )
        ],
      ),
    );
  }
}
