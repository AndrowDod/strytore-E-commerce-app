import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../block/tab_bar_cubit.dart';

// ignore: must_be_immutable
class CustomTopBottons extends StatelessWidget {
  bool cont;
  String text;
  CustomTopBottons({
    super.key,
    required this.cont,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (text == "All") {
          context.read<TabBarCubit>().changeColorTabBar1();
        } else if (text == "Summer") {
          context.read<TabBarCubit>().changeColorTabBar2();
        } else if (text == "Man") {
          context.read<TabBarCubit>().changeColorTabBar3();
        } else if (text == "Women") {
          context.read<TabBarCubit>().changeColorTabBar4();
        }
      },
      child: Container(
        height: 30.h,
        width: 60.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: cont == false
              ? const Color(0xffF3ECFA)
              : const Color.fromARGB(255, 144, 99, 233),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: cont == false ? Colors.black : Colors.white,
                fontSize: 13.sp,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
