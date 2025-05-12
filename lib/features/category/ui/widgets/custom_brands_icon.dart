import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theming/app_colors.dart';

class CustomBrandsIcon extends StatelessWidget {
  const CustomBrandsIcon({super.key, required this.imageSrc});

  final String imageSrc;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 45.r,
          height: 45.r,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(width: 1, color: AppColors.kPrimaryColor),
          ),
          child: Center(
            child: SvgPicture.asset(
              colorFilter: const ColorFilter.mode(
                AppColors.kTextColor,
                BlendMode.srcIn,
              ),

              imageSrc,
              width: 26.r,
              height: 26.r,
            ),
          ),
        ),
      ],
    );
  }
}
