import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class UploadImageWidget extends StatefulWidget {
  UploadImageWidget({super.key, required this.image, required this.pickImage});

  // ignore: prefer_typing_uninitialized_variables
  var image;
  Function() pickImage;

  @override
  State<UploadImageWidget> createState() => _UploadImageWidgetState();
}

class _UploadImageWidgetState extends State<UploadImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 25.h, left: 20.w),
          child: Text(
            "Add Photo of the prodact",
            style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: const Color.fromARGB(189, 0, 0, 0)),
          ),
        ),
        Center(
          child: GestureDetector(
            onTap: () {
              if (widget.image == null) {
                widget.pickImage();
              }
            },
            child: Container(
              padding: EdgeInsets.all(20.h),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(50.r)),
              child: DottedBorder(
                borderType: BorderType.RRect,
                radius: Radius.circular(20.r),
                strokeWidth: 2.w,
                dashPattern: const [3, 5],
                color: Colors.black26,
                child: widget.image == null
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // upload icon

                          ImageIcon(
                            size: 80.sp,
                            const AssetImage(
                              "assets/icons/cloud-computing.png",
                            ),
                            color: const Color.fromARGB(255, 114, 25, 174),
                          ),

                          // text click here ....

                          Center(
                            child: Padding(
                              padding: EdgeInsets.all(10.h),
                              child: Text(
                                "Click here to upload",
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Colors.black26,
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    : Stack(
                        children: [
                          Container(
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r)),
                            child: Image.file(
                              widget.image!,
                              fit: BoxFit.cover,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                widget.image = null;
                              });
                            },
                            icon: Icon(
                              Icons.close,
                              size: 30.sp,
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
