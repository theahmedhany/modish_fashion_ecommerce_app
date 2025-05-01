import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';

class OrderHistoryScreenItem extends StatelessWidget {
  const OrderHistoryScreenItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.press,
  });

  final String title, subTitle;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: press,
          contentPadding: EdgeInsets.symmetric(horizontal: 26.r),
          leading: Container(
            width: 40.w,
            height: 40.h,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.r),
                side: BorderSide(color: AppColors.kPrimaryColor, width: 1.5.r),
              ),
            ),
            child: Center(
              child: SvgPicture.asset(
                'assets/icons/order_box.svg',
                width: 22.w,
                colorFilter: const ColorFilter.mode(
                  AppColors.kPrimaryColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          title: Text(
            title,
            maxLines: 1,
            style: AppFonts.font18DarkRegular.copyWith(
              overflow: TextOverflow.ellipsis,
            ),
          ),
          subtitle: Text(
            subTitle,
            maxLines: 1,
            style: AppFonts.font14GreyRegular.copyWith(
              overflow: TextOverflow.ellipsis,
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios_rounded,
            color: AppColors.kPrimaryColor,
          ),
        ),
        Divider(
          color: AppColors.kMainGrey.withValues(alpha: 0.5),
          endIndent: 20.r,
          indent: 20.r,
        ),
      ],
    );
  }
}
