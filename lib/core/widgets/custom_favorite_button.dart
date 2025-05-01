import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../features/favorite/data/models/favorite_model.dart';
import '../../features/favorite/logic/favorite_cubit.dart';
import '../theming/app_colors.dart';

class CustomFavoriteButton extends StatelessWidget {
  final String itemId;
  final String name;
  final double price;
  final String imageUrl;

  const CustomFavoriteButton({
    super.key,
    required this.itemId,
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, List<FavoriteProductData>>(
      builder: (context, favoriteItems) {
        final isFavorite = favoriteItems.any(
          (favProduct) => favProduct.productId == itemId,
        );

        return GestureDetector(
          onTap: () {
            final product = FavoriteProductData(
              productId: itemId,
              name: name,
              price: price,
              pictureUrl: imageUrl,
            );
            context.read<FavoriteCubit>().toggleFavorite(product);
          },
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isFavorite ? Colors.red : AppColors.kPrimaryColor,
                width: 1.5,
              ),
            ),
            child: Center(
              child: SvgPicture.asset(
                isFavorite
                    ? 'assets/icons/solid_heart.svg'
                    : 'assets/icons/heart.svg',
                width: 18,
                height: 18,
                colorFilter: ColorFilter.mode(
                  isFavorite ? Colors.red : AppColors.kPrimaryColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
