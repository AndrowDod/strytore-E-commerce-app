import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stytore/core/utils/constes.dart';
import 'package:stytore/features/auth/auth_bloc/sign_up/signup_controller_cubit_state.dart';
import '../../../../core/widgets/flushbar_Widget.dart';

class SignUpControllerCubit extends Cubit<SingUpControllerCubitState> {
  SignUpControllerCubit() : super(SingUpControllerCubitInitial());

  getSignUpControllerData(
      usernameController, emailController, passwordController) {
    emit(
      GetSignUpControllerListCubit(
        state.usernameController = usernameController,
        state.emailController = emailController,
        state.passwordController = passwordController,
      ),
    );
  }

  createAcounWithEmailAndPassword(email, password, context) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      //create Users collection

      await FirebaseFirestore.instance
          .collection(usersCollectionName)
          .doc(email)
          .set({});
      // flushbarWidget(context, "Sign Up", "Sucsses");
    } on FirebaseAuthException catch (error) {
      if (error.code == 'email-already-in-use') {
        flushbarWidget(context, "Error", "This email is already in use ");
      } else if (error.code == 'weak-password') {
        flushbarWidget(context, "Error", "This password is weak ");
      }
    }
  }
}
