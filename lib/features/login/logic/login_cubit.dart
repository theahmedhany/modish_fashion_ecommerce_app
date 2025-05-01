import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
import '../../../../core/networking/dio_factory.dart';
import '../data/models/login_request_body.dart';
import '../data/repos/login_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.idle());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginStates() async {
    if (!formKey.currentState!.validate()) return;

    emit(const LoginState.loading());
    try {
      final response = await _loginRepo.login(
        LoginRequestBody(
          emailOrUserName: emailController.text.trim(),
          password: passwordController.text.trim(),
        ),
      );

      response.when(
        success: (loginResponse) async {
          await saveUserToken(loginResponse.token ?? '');
          await saveNameAndEmail(
            loginResponse.displayName ?? '',
            loginResponse.email ?? '',
            loginResponse.appUserId ?? '',
          );
          emit(LoginState.success(loginResponse));
        },
        failure: (error) {
          emit(
            LoginState.error(
              error:
                  error.message ??
                  "An unexpected error occurred. Please try again.",
            ),
          );
        },
      );
    } catch (e) {
      emit(
        const LoginState.error(
          error: "An unexpected error occurred. Please try again.",
        ),
      );
    }
  }

  Future<void> saveUserToken(String token) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
    DioFactory.setTokenIntoHeaderAfterLogin(token);
  }

  Future<void> saveNameAndEmail(
    String name,
    String email,
    String appUserId,
  ) async {
    await SharedPrefHelper.setData(SharedPrefKeys.userName, name);
    await SharedPrefHelper.setData(SharedPrefKeys.userEmail, email);
    await SharedPrefHelper.setData(SharedPrefKeys.appUserId, appUserId);
  }
}
