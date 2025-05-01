import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;
  const PasswordValidations({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacters,
    required this.hasNumber,
    required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.r),
      child: Column(
        children: [
          buildValidationRow('At least 1 lowercase letter', hasLowerCase),
          verticalSpace(2),
          buildValidationRow('At least 1 uppercase letter', hasUpperCase),
          verticalSpace(2),
          buildValidationRow(
            'At least 1 special character',
            hasSpecialCharacters,
          ),
          verticalSpace(2),
          buildValidationRow('At least 1 number', hasNumber),
          verticalSpace(2),
          buildValidationRow('At least 8 characters long', hasMinLength),
        ],
      ),
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        CircleAvatar(
          radius: 2.5,
          backgroundColor:
              hasValidated
                  ? AppColors.kMainGrey.withValues(alpha: 0.8)
                  : AppColors.kPrimaryColor,
        ),
        horizontalSpace(6),
        Text(
          text,
          style: AppFonts.font12DarkRegular.copyWith(
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationColor: AppColors.kPrimaryColor.withValues(alpha: 0.8),
            decorationThickness: 2,
            color:
                hasValidated
                    ? AppColors.kMainGrey.withValues(alpha: 0.8)
                    : AppColors.kPrimaryColor,
          ),
        ),
      ],
    );
  }
}
