import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';

class DetailsHeaderIcons extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const DetailsHeaderIcons({super.key, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: AppColors.kPrimaryColor.withAlpha(76),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: AppColors.kPrimaryColor, size: 20.r),
      ),
    );
  }
}
