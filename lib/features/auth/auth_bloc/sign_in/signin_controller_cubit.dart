import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stytore/features/auth/auth_bloc/sign_in/signin_controller_cubit_state.dart';
import '../../../../core/utils/constes.dart';
import '../../../../core/widgets/flushbar_Widget.dart';

class SignInControllerCubit extends Cubit<SingInControllerCubitState> {
  SignInControllerCubit() : super(SingInControllerCubitInitial());

  getSignInControllerData(emailController, passwordController) {
    emit(
      GetSignInControllerListCubit(
        state.emailController = emailController,
        state.passwordController = passwordController,
      ),
    );
  }

  signInWithEmailAndPassword(email, password, context) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.of(context).pushReplacementNamed(
        bottomBarRouteName,
      );
      flushbarWidget(context, "Sign In", "Sucsses");
    } on FirebaseAuthException catch (e) {
      flushbarWidget(context, "There is error",
          "Check your email and password and try again");
      print(e);
    }
  }
}
