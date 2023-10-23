import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColorsWidget extends StatelessWidget {
  const ColorsWidget({super.key, required this.listOfColors});

  final List listOfColors;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // color text
        Padding(
          padding: EdgeInsets.only(top: 25.h, left: 20.w),
          child: Text(
            "Color",
            style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: const Color.fromARGB(189, 0, 0, 0)),
          ),
        ),

        // colors
        Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: SizedBox(
            height: 40.h,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: listOfColors.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(6.w),
                  child: Container(
                    width: 30.w,
                    decoration: BoxDecoration(
                        color: listOfColors[index],
                        borderRadius: BorderRadius.circular(10.r)),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
