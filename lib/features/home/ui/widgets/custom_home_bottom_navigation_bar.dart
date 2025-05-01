import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import 'custom_home_bottom_navigation_bar_icon.dart';

class CustomHomeBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomHomeBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: currentIndex == 2 ? Colors.white : AppColors.kBackgroundColor,
      child: Container(
        height: 70.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.kMainGrey.withValues(alpha: 0.4),
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0, -5),
            ),
          ],
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomHomeBottomNavigationBarIcon(
              icon: 'assets/icons/home.svg',
              selected: currentIndex == 0,
              press: () => onTap(0),
            ),
            CustomHomeBottomNavigationBarIcon(
              icon: 'assets/icons/search.svg',
              selected: currentIndex == 1,
              press: () => onTap(1),
            ),
            CustomHomeBottomNavigationBarIcon(
              icon: 'assets/icons/heart.svg',
              selected: currentIndex == 2,
              press: () => onTap(2),
            ),
            CustomHomeBottomNavigationBarIcon(
              icon: 'assets/icons/profile.svg',
              selected: currentIndex == 3,
              press: () => onTap(3),
            ),
          ],
        ),
      ),
    );
  }
}
