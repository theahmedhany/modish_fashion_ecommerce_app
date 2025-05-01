import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';

class CustomHomeDrawerItem extends StatelessWidget {
  const CustomHomeDrawerItem({
    super.key,
    required this.text,
    required this.icon,
    required this.press,
  });

  final String text, icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      contentPadding: EdgeInsets.symmetric(horizontal: 26.r),
      leading: SvgPicture.asset(
        icon,
        width: 22.w,
        colorFilter: ColorFilter.mode(AppColors.kTextColor, BlendMode.srcIn),
      ),
      title: Text(text, style: AppFonts.font18DarkRegular),
    );
  }
}
