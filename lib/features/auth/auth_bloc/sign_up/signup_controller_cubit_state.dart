abstract class SingUpControllerCubitState {
  String usernameController;
  String emailController;
  String passwordController;

  SingUpControllerCubitState({
    required this.usernameController,
    required this.emailController,
    required this.passwordController,
  });
}

class SingUpControllerCubitInitial extends SingUpControllerCubitState {
  SingUpControllerCubitInitial()
      : super(
          usernameController: "",
          emailController: "",
          passwordController: "",
        );
}

class GetSignUpControllerListCubit extends SingUpControllerCubitState {
  GetSignUpControllerListCubit(
    String cubitUsernameController,
    String cubitEmailController,
    String cubitPasswordController,
  ) : super(
          usernameController: cubitUsernameController,
          emailController: cubitEmailController,
          passwordController: cubitPasswordController,
        );
}
