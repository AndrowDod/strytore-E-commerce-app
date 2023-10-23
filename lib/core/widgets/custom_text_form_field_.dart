import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class TextFieldWidget extends StatelessWidget {
  TextFieldWidget({
    super.key,
    required this.hinttext,
    required this.theicon,
    this.password = false,
    required this.controller,
    this.keyboardType,
  });
  TextInputType? keyboardType;
  String? hinttext;
  IconData? theicon;
  bool password;
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25.w, right: 25.w),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value!.isEmpty) {
            return "this field required";
          }
          return null;
        },
        obscureText: password,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            hintText: hinttext,
            hintStyle: const TextStyle(color: Colors.black38),
            fillColor: const Color.fromARGB(161, 254, 218, 255),
            filled: true,
            border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.transparent,
                ),
                borderRadius: BorderRadius.circular(30)),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 25, right: 10),
              child: Icon(
                theicon,
                color: const Color.fromARGB(157, 0, 0, 0),
                size: 30,
              ),
            )),
      ),
    );
  }
}
