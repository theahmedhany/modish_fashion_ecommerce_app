import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';
import '../../../../core/widgets/custom_main_app_bar.dart';
import '../../data/models/favorite_model.dart';
import '../../logic/favorite_cubit.dart';
import '../widgets/favorite_products_list.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key, required this.scaffoldKey});

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<FavoriteCubit>().loadFavorites();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          verticalSpace(14),
          CustomMainAppBar(scaffoldKey: widget.scaffoldKey, title: 'Favorites'),
          verticalSpace(30),
          Expanded(
            child: BlocConsumer<FavoriteCubit, List<FavoriteProductData>>(
              listener: (context, state) {},
              builder: (context, favoriteProducts) {
                if (favoriteProducts.isEmpty) {
                  return Center(
                    child: Text(
                      "No favorite items yet",
                      style: AppFonts.font18DarkMedium,
                    ),
                  );
                }

                return Column(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.r),
                        color: AppColors.kBackgroundColor,
                        child: FavoriteProductsList(
                          favoriteProducts: favoriteProducts,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
