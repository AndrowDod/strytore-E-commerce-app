import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDialogWidget extends StatelessWidget {
  const CustomDialogWidget(
      {super.key, required this.isSuccess, required this.text});

  final bool isSuccess;
  final String text;

  @override
  Widget build(BuildContext context) {
    double theheight = MediaQuery.of(context).size.height;
    double thewidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Dialog(
          child: SizedBox(
            height: 200.h,
            child: Center(
                child: Text(
              text,
              style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.bold,
              ),
            )),
          ),
        ),
        Positioned(
          top: theheight / 3.5,
          left: thewidth / 3,
          right: thewidth / 3,
          child: Container(
            clipBehavior: Clip.hardEdge,
            height: 80.h,
            width: 80.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: isSuccess == false
                ? Image.asset("assets/icons/error_icon.png")
                : Image.asset("assets/icons/success_icon.png"),
          ),
        ),
      ],
    );
  }
}
