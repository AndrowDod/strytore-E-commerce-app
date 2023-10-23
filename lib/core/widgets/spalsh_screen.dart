import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stytore/core/utils/constes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      FirebaseAuth.instance.currentUser != null
          ? Navigator.pushReplacementNamed(context, bottomBarRouteName)
          : Navigator.pushReplacementNamed(context, signInRouteName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Image.asset(
            "assets/images/background.jpg",
            fit: BoxFit.fill,
          ),
        ),
        Center(
            child: Image.asset(
          "assets/images/logo.png",
          color: Colors.white,
        )),
      ]),
    );
  }
}
