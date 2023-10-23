import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stytore/core/widgets/flushbar_Widget.dart';
import '../../../core/utils/constes.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_space_widget.dart';
import '../../../core/widgets/custom_text_form_field_.dart';
import '../auth_bloc/sign_up/signup_controller_cubit.dart';
import '../auth_bloc/sign_up/signup_controller_cubit_state.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final signUpFormKey = GlobalKey<FormState>();
  TextEditingController usenameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      //app bar

      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 25.sp,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),

      //body

      body: BlocBuilder<SignUpControllerCubit, SingUpControllerCubitState>(
        builder: (context, state) => SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  //the purpule container
                  Container(
                    height: 550.h,
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
                    key: signUpFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //the logo

                        SizedBox(height: 100.h),
                        Center(child: Image.asset('assets/images/logo.png')),
                        const SpaceWidget(),

                        //text style store
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Style ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 35.sp,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Text(
                              ' Store',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 35.sp,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),

                        //username textfield
                        const SpaceWidget(),
                        TextFieldWidget(
                          hinttext: "Username",
                          theicon: Icons.account_circle_outlined,
                          controller: usenameController,
                        ),

                        //email textfield
                        const SpaceWidget(),
                        TextFieldWidget(
                          hinttext: "Email",
                          theicon: Icons.email_outlined,
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
                      ],
                    ),
                  ),
                ],
              ),

              //sign up button
              const SpaceWidget(),
              Buttons(
                operation: "SIGN UP",
                onPressed: () {
                  if (signUpFormKey.currentState!.validate()) {
                    //create account
                    context
                        .read<SignUpControllerCubit>()
                        .createAcounWithEmailAndPassword(
                          emailController.text,
                          passwordController.text,
                          context,
                        );

                    //set data in cubit
                    context
                        .read<SignUpControllerCubit>()
                        .getSignUpControllerData(usenameController.text,
                            emailController.text, passwordController.text);

                    flushbarWidget(context, "Sign Up", "Sucsses");

                    Navigator.of(context).pushReplacementNamed(
                      signInRouteName,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
