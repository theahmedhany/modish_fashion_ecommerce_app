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
    this.statusColor,
    this.amount,
    this.items,
  });

  final String title, subTitle;
  final VoidCallback press;
  final Color? statusColor;
  final String? amount;
  final String? items;

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
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                subTitle,
                maxLines: 1,
                style: AppFonts.font14GreyRegular.copyWith(
                  overflow: TextOverflow.ellipsis,
                  color: statusColor,
                ),
              ),
              if (items != null || amount != null) SizedBox(height: 4.h),
              if (items != null || amount != null)
                Row(
                  children: [
                    if (items != null)
                      Text(
                        items!,
                        style: AppFonts.font12GreyRegular.copyWith(
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    if (items != null && amount != null)
                      Text(' • ', style: AppFonts.font12GreyRegular),
                    if (amount != null)
                      Text(
                        amount!,
                        style: AppFonts.font12GreyRegular.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.kPrimaryColor,
                        ),
                      ),
                  ],
                ),
            ],
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
