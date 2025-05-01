import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../helpers/extensions.dart';
import '../routing/routes.dart';
import '../theming/app_fonts.dart';

class CustomMainAppBar extends StatefulWidget {
  const CustomMainAppBar({
    super.key,
    required this.scaffoldKey,
    required this.title,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;
  final String title;

  @override
  State<CustomMainAppBar> createState() => _CustomMainAppBarState();
}

class _CustomMainAppBarState extends State<CustomMainAppBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CupertinoButton(
            onPressed: () {
              widget.scaffoldKey.currentState?.openDrawer();
            },
            padding: EdgeInsets.zero,
            child: SvgPicture.asset(
              'assets/icons/menu.svg',
              width: 20.r,
              height: 20.r,
            ),
          ),
          Text(widget.title, style: AppFonts.font20DarkBold),
          CupertinoButton(
            onPressed: () {
              context.pushNamed(Routes.notificationsScreen);
            },
            padding: EdgeInsets.zero,
            child: SvgPicture.asset(
              'assets/icons/notifications.svg',
              width: 30.r,
              height: 30.r,
            ),
          ),
        ],
      ),
    );
  }
}
