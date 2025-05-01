import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/app_regex.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../logic/signup_cubit.dart';
import '../widgets/password_validations.dart';
import '../widgets/signup_bloc_listener.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;
  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<SignupCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters = AppRegex.hasSpecialCharacter(
          passwordController.text,
        );
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  void validateThenDoSignup(BuildContext context) {
    if (context.read<SignupCubit>().formKey.currentState!.validate()) {
      context.read<SignupCubit>().emitSignupStates();
    }
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
                verticalSpace(100),
                const _HeaderText(),
                verticalSpace(50),
                Form(
                  key: context.read<SignupCubit>().formKey,
                  child: Column(
                    children: [
                      _NameField(
                        controller:
                            context.read<SignupCubit>().userNameController,
                      ),
                      verticalSpace(26),
                      _EmailField(
                        controller: context.read<SignupCubit>().emailController,
                      ),
                      verticalSpace(26),
                      _PasswordField(
                        controller: passwordController,
                        isObscure: isPasswordObscureText,
                        toggleVisibility: () {
                          setState(() {
                            isPasswordObscureText = !isPasswordObscureText;
                          });
                        },
                      ),
                      verticalSpace(26),
                      _ConfirmationPasswordField(
                        controller:
                            context
                                .read<SignupCubit>()
                                .confirmPasswordController,
                        passwordController: passwordController,
                        isObscure: isPasswordConfirmationObscureText,
                        toggleVisibility: () {
                          setState(() {
                            isPasswordConfirmationObscureText =
                                !isPasswordConfirmationObscureText;
                          });
                        },
                      ),
                      verticalSpace(20),
                      PasswordValidations(
                        hasLowerCase: hasLowercase,
                        hasUpperCase: hasUppercase,
                        hasSpecialCharacters: hasSpecialCharacters,
                        hasNumber: hasNumber,
                        hasMinLength: hasMinLength,
                      ),
                      verticalSpace(30),
                      AppButton(
                        press: () => validateThenDoSignup(context),
                        buttonTitle: 'Sign Up',
                      ),
                      verticalSpace(14),
                      const _LoginText(),
                      verticalSpace(50),
                    ],
                  ),
                ),
                const SignupBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    passwordController.removeListener(() {});
    super.dispose();
  }
}

class _HeaderText extends StatelessWidget {
  const _HeaderText();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Create Account', style: AppFonts.font28DarkMedium),
        Text(
          'Let\'s Create Account Together',
          style: AppFonts.font16GreyRegular,
        ),
      ],
    );
  }
}

class _NameField extends StatelessWidget {
  final TextEditingController controller;

  const _NameField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Your Name', style: AppFonts.font16DarkMedium),
        verticalSpace(12),
        AppTextField(
          controller: controller,
          hintText: 'Enter Your Full Name.',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your full name.';
            }
            return null;
          },
        ),
      ],
    );
  }
}

class _EmailField extends StatelessWidget {
  final TextEditingController controller;

  const _EmailField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Email Address', style: AppFonts.font16DarkMedium),
        verticalSpace(12),
        AppTextField(
          controller: controller,
          hintText: 'Enter Your Email Address.',
          validator: (value) {
            final trimmedValue = value?.trim() ?? '';
            if (trimmedValue.isEmpty || !AppRegex.isEmailValid(trimmedValue)) {
              return 'Please enter a valid email..';
            }
            return null;
          },
        ),
      ],
    );
  }
}

class _PasswordField extends StatelessWidget {
  final TextEditingController controller;
  final bool isObscure;
  final VoidCallback toggleVisibility;

  const _PasswordField({
    required this.controller,
    required this.isObscure,
    required this.toggleVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Password', style: AppFonts.font16DarkMedium),
        verticalSpace(12),
        AppTextField(
          controller: controller,
          hintText: 'Enter Your Password.',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a valid password.';
            }
            if (!AppRegex.hasLowerCase(value)) {
              return 'Password must contain a lowercase letter.';
            }
            if (!AppRegex.hasUpperCase(value)) {
              return 'Password must contain an uppercase letter.';
            }
            if (!AppRegex.hasNumber(value)) {
              return 'Password must contain a number.';
            }
            if (!AppRegex.hasSpecialCharacter(value)) {
              return 'Password must contain a special character.';
            }
            if (!AppRegex.hasMinLength(value)) {
              return 'Password must be at least 8 characters long.';
            }
            return null;
          },
          isObscureText: isObscure,
          suffixIcon: IconButton(
            icon: Icon(
              isObscure ? Icons.visibility_off : Icons.visibility,
              color: AppColors.kMainGrey,
              size: 20.r,
            ),
            onPressed: toggleVisibility,
          ),
        ),
      ],
    );
  }
}

class _ConfirmationPasswordField extends StatelessWidget {
  final TextEditingController controller;
  final TextEditingController passwordController;
  final bool isObscure;
  final VoidCallback toggleVisibility;

  const _ConfirmationPasswordField({
    required this.controller,
    required this.passwordController,
    required this.isObscure,
    required this.toggleVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Confirm Password', style: AppFonts.font16DarkMedium),
        verticalSpace(12),
        AppTextField(
          controller: controller,
          hintText: 'Confirm Your Password.',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please confirm your password.';
            }
            if (value != passwordController.text) {
              return 'Passwords do not match.';
            }
            return null;
          },
          isObscureText: isObscure,
          suffixIcon: IconButton(
            icon: Icon(
              isObscure ? Icons.visibility_off : Icons.visibility,
              color: AppColors.kMainGrey,
              size: 20.r,
            ),
            onPressed: toggleVisibility,
          ),
        ),
      ],
    );
  }
}

class _LoginText extends StatelessWidget {
  const _LoginText();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pop();
      },
      borderRadius: BorderRadius.circular(50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Already have an account? ', style: AppFonts.font14GreyRegular),
          Text('Login', style: AppFonts.font14DarkMedium),
        ],
      ),
    );
  }
}
