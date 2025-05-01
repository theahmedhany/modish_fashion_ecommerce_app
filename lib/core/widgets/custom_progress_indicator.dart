import 'package:flutter/material.dart';

import '../theming/app_colors.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: AppColors.kPrimaryColor,
        strokeWidth: 2,
        backgroundColor: AppColors.kSecondaryGrey,
      ),
    );
  }
}
