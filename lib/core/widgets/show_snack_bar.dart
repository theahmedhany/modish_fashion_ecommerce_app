import 'package:flutter/material.dart';

import '../theming/app_colors.dart';
import '../theming/app_fonts.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        label: 'Ok',
        textColor: AppColors.kTextColor,
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
      backgroundColor: AppColors.kPrimaryColor,
      content: Text(message, style: AppFonts.font12DarkRegular),
    ),
  );
}
