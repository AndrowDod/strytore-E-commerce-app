import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddNameWidget extends StatefulWidget {
  const AddNameWidget({super.key});

  @override
  State<AddNameWidget> createState() => AddNameWidgetState();
}

class AddNameWidgetState extends State<AddNameWidget> {
  static TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    nameController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 25.h, left: 20.w),
          child: Text(
            "Add name of prodact",
            style: TextStyle(
                fontSize: 20.sp, color: const Color.fromARGB(189, 0, 0, 0)),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(20.sp),
          child: DottedBorder(
            borderType: BorderType.RRect,
            radius: Radius.circular(20.r),
            strokeWidth: 2.w,
            dashPattern: const [3, 5],
            color: Colors.black26,
            child: Padding(
              padding: EdgeInsets.all(8.0.sp),
              child: TextField(
                keyboardType: TextInputType.name,
                style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
                controller: nameController,
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(borderSide: BorderSide.none)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
