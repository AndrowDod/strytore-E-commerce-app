//flush bar widget

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void flushbarWidget(context, title, message) {
  Flushbar(
    duration: const Duration(seconds: 1),
    padding: const EdgeInsets.all(10),
    borderRadius: BorderRadius.circular(8.r),
    backgroundGradient: const LinearGradient(colors: [
      Color.fromARGB(255, 100, 53, 193),
      Colors.purple,
    ]),
    boxShadows: const [
      BoxShadow(
        color: Colors.black45,
        offset: Offset(3, 3),
        blurRadius: 3,
      ),
    ],
    dismissDirection: FlushbarDismissDirection.HORIZONTAL,
    forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
    title: title,
    message: message,
  ).show(context);
}
