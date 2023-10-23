import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stytore/core/widgets/custom_dialog_widget.dart';

import '../utils/constes.dart';

class TheDrawer extends StatelessWidget {
  const TheDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xffF3ECFA),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // add new prodact button
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, addNewProdactRouteName);
                Scaffold.of(context).closeDrawer();
              },
              child: Text(
                "Add New Prodact",
                style: TextStyle(fontSize: 15.sp),
              ),
            ),
          ),

          // sign out button
          Center(
            child: ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacementNamed(context, signInRouteName);
              },
              child: const Text("sign out"),
            ),
          ),

          // test button
          Center(
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => const CustomDialogWidget(
                    isSuccess: false,
                    text: "this prodact is already in cart",
                  ),
                );
              },
              child: Text(
                "test",
                style: TextStyle(fontSize: 15.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerBotton extends StatelessWidget {
  const DrawerBotton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, top: 20.h),
      child: Builder(builder: (context) {
        return GestureDetector(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: SizedBox(
              height: 35.h,
              width: 35.w,
              child: Image.asset("assets/icons/menu.png")),
        );
      }),
    );
  }
}
