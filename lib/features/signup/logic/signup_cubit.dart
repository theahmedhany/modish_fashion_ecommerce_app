import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/signup_request_body.dart';
import '../data/repos/signup_repo.dart';
import 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo _signupRepo;
  SignupCubit(this._signupRepo) : super(const SignupState.idle());

  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void emitSignupStates() async {
    if (!formKey.currentState!.validate()) return;

    emit(const SignupState.loading());
    try {
      final response = await _signupRepo.signup(
        SignupRequestBody(
          email: emailController.text.trim(),
          userName: userNameController.text.trim(),
          password: passwordController.text.trim(),
          confirmPassword: confirmPasswordController.text.trim(),
        ),
      );

      response.when(
        success: (signupResponse) async {
          emit(SignupState.success(signupResponse));
        },
        failure: (error) {
          emit(
            SignupState.error(
              error:
                  error.message ??
                  "An unexpected error occurred. Please try again.",
            ),
          );
        },
      );
    } catch (e) {
      emit(
        SignupState.error(
          error: "An unexpected error occurred. Please try again.",
        ),
      );
    }
  }
}
