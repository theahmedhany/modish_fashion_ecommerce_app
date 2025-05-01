import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';
import '../../../../core/widgets/custom_favorite_button.dart';
import '../../data/models/product_details_model.dart';

class DetailsBuySection extends StatelessWidget {
  const DetailsBuySection({super.key, required this.details});

  final ProductDetailsModel details;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 45.w,
          height: 45.h,
          decoration: BoxDecoration(
            color: const Color(0xFFE1E1E1),
            shape: BoxShape.circle,
          ),
          child: CustomFavoriteButton(
            itemId: details.id ?? 'Unknown ID',
            name: details.name ?? 'Unknown Product',
            price: details.price ?? 0.0,
            imageUrl: details.pictureUrl ?? 'Unknown URL',
          ),
        ),
        horizontalSpace(16),
        Expanded(
          child: CupertinoButton(
            onPressed: () {
              context.pushNamed(
                Routes.newOrderScreen,
                arguments: {
                  'productName': details.name ?? 'Unknown Product',
                  'productImage': details.pictureUrl ?? 'Unknown URL',
                  'productPrice': details.price ?? 0.0,
                  'productId': details.id ?? 'Unknown ID',
                },
              );
            },
            padding: EdgeInsets.zero,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              decoration: ShapeDecoration(
                color: AppColors.kPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: Center(
                child: Text('Buy Now', style: AppFonts.font18WhiteMedium),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
