import 'package:flutter/material.dart';

import '../helpers/extensions.dart';
import '../theming/app_colors.dart';
import '../theming/app_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.kBackgroundColor,
      scrolledUnderElevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: AppColors.kTextColor,
        ),
        onPressed: () {
          context.pop();
        },
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.more_vert_rounded, color: AppColors.kTextColor),
          onPressed: () {},
        ),
      ],
      title: Text(title, style: AppFonts.font18DarkBold),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
