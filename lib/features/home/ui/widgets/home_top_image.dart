import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';

class HomeTopImage extends StatelessWidget {
  const HomeTopImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 168.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.kPrimaryColor,
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/model_4.png'),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 20.r),
        child: Align(
          alignment: Alignment.topRight,
          child: Text(
            'Autumn\nCollection\n2025',
            style: AppFonts.font22WhiteBold,
          ),
        ),
      ),
    );
  }
}
