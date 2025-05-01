import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/app_regex.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';
import '../../../../core/widgets/app_button.dart';
import '../../logic/login_cubit.dart';
import '../widgets/login_bloc_listener.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.r),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                verticalSpace(120),
                const _HeaderText(),
                verticalSpace(50),
                Form(
                  key: context.read<LoginCubit>().formKey,
                  child: Column(
                    children: [
                      const _EmailField(),
                      verticalSpace(30),
                      _PasswordField(
                        obscureText: _obscureText,
                        onToggleVisibility: _togglePasswordVisibility,
                      ),
                      verticalSpace(58),
                      _LoginButton(obscureText: _obscureText),
                      verticalSpace(14),
                      const _SignupText(),
                    ],
                  ),
                ),
                const LoginBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _HeaderText extends StatelessWidget {
  const _HeaderText();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Hello Again!', style: AppFonts.font28DarkMedium),
        Text(
          'Welcome Back You\'ve Been Missed!',
          style: AppFonts.font16GreyRegular,
        ),
      ],
    );
  }
}

class _EmailField extends StatelessWidget {
  const _EmailField();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Email Address', style: AppFonts.font16DarkMedium),
        verticalSpace(12),
        TextFormField(
          controller: context.read<LoginCubit>().emailController,
          validator: (value) {
            final trimmedValue = value?.trim() ?? '';
            if (trimmedValue.isEmpty || !AppRegex.isEmailValid(trimmedValue)) {
              return 'Please enter a valid email.';
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: 'Enter Your Email Address.',
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide.none,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(color: Colors.red, width: 1.5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(color: Colors.redAccent, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}

class _PasswordField extends StatelessWidget {
  final bool obscureText;
  final VoidCallback onToggleVisibility;

  const _PasswordField({
    required this.obscureText,
    required this.onToggleVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Password', style: AppFonts.font16DarkMedium),
        verticalSpace(12),
        TextFormField(
          controller: context.read<LoginCubit>().passwordController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password.';
            }
            return null;
          },
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: 'Enter Your Password.',
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide.none,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(color: Colors.red, width: 1.5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(color: Colors.redAccent, width: 2),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                obscureText ? Icons.visibility_off : Icons.visibility,
                color: AppColors.kMainGrey,
              ),
              onPressed: onToggleVisibility,
            ),
          ),
        ),
      ],
    );
  }
}

class _LoginButton extends StatelessWidget {
  final bool obscureText;

  const _LoginButton({required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      press: () {
        validateThenDoLogin(context);
      },
      buttonTitle: 'Login',
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates();
    }
  }
}

class _SignupText extends StatelessWidget {
  const _SignupText();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(Routes.signupScreen);
      },
      borderRadius: BorderRadius.circular(50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Don\'t have an account? ', style: AppFonts.font14GreyRegular),
          Text('Sign Up.', style: AppFonts.font14DarkMedium),
        ],
      ),
    );
  }
}
