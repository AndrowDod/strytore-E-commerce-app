import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stytore/core/utils/constes.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_space_widget.dart';
import '../../../core/widgets/custom_text_form_field_.dart';
import '../auth_bloc/sign_in/signin_controller_cubit.dart';
import '../auth_bloc/sign_in/signin_controller_cubit_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final signInFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<SignInControllerCubit, SingInControllerCubitState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  //the purpule container
                  Container(
                    height: 520.h,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 100, 53, 193),
                          Colors.purple
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(35.r),
                        bottomRight: Radius.circular(35.r),
                      ),
                    ),
                  ),

                  //the content in the purpule container
                  Form(
                    key: signInFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //the logo
                        SizedBox(height: 100.h),
                        Center(child: Image.asset('assets/images/logo.png')),
                        const SpaceWidget(),

                        //text style store
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Style ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Text(
                              ' Store',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),

                        //username textfield
                        const SpaceWidget(),
                        TextFieldWidget(
                          hinttext: "Email",
                          theicon: Icons.account_circle_outlined,
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                        ),

                        //password
                        const SpaceWidget(),
                        TextFieldWidget(
                          hinttext: "Password",
                          theicon: Icons.password,
                          password: true,
                          controller: passwordController,
                        ),

                        // forgot Password
                        const SpaceWidget(),
                        Padding(
                          padding: EdgeInsets.only(left: 35.w, top: 8.h),
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Forgot Password ? ",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              //sign in button
              const SpaceWidget(),
              Buttons(
                operation: "SIGN IN",
                onPressed: () {
                  if (signInFormKey.currentState!.validate()) {
                    //create account
                    context
                        .read<SignInControllerCubit>()
                        .signInWithEmailAndPassword(
                          emailController.text,
                          passwordController.text,
                          context,
                        );

                    //set data in cubit
                    context
                        .read<SignInControllerCubit>()
                        .getSignInControllerData(
                            emailController.text, passwordController.text);

                    // create users collection
                  }
                },
              ),

              //the divider and text "OR"
              const SpaceWidget(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 150.w,
                    child: Divider(
                      height: 8.h,
                      color: Colors.black26,
                    ),
                  ),
                  Text(
                    "OR",
                    style: TextStyle(fontSize: 18.sp),
                  ),
                  SizedBox(
                    width: 150.w,
                    child: Divider(
                      height: 8.h,
                      color: Colors.black26,
                    ),
                  ),
                ],
              ),

              //sign up button
              const SpaceWidget(),
              Buttons(
                operation: "SIGN UP",
                onPressed: () {
                  Navigator.of(context).pushNamed(signUpRouteName);
                },
              ),
              const SpaceWidget(),
            ],
          ),
        );
      },
    ));
  }
}
