import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theming/app_colors.dart';

class CustomHomeBottomNavigationBarIcon extends StatelessWidget {
  const CustomHomeBottomNavigationBarIcon({
    super.key,
    required this.icon,
    required this.selected,
    required this.press,
  });

  final String icon;
  final bool selected;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Center(
        child: SvgPicture.asset(
          icon,
          colorFilter: ColorFilter.mode(
            selected ? AppColors.kTextColor : Color(0xffE2E2E2),
            BlendMode.srcIn,
          ),
          width: 22.w,
        ),
      ),
    );
  }
}
