abstract class SingInControllerCubitState {
  String emailController;
  String passwordController;

  SingInControllerCubitState({
    required this.emailController,
    required this.passwordController,
  });
}

class SingInControllerCubitInitial extends SingInControllerCubitState {
  SingInControllerCubitInitial()
      : super(
          emailController: "",
          passwordController: "",
        );
}

class GetSignInControllerListCubit extends SingInControllerCubitState {
  GetSignInControllerListCubit(
    String cubitEmailController,
    String cubitPasswordController,
  ) : super(
          emailController: cubitEmailController,
          passwordController: cubitPasswordController,
        );
}
