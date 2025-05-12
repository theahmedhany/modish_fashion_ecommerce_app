import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_progress_indicator.dart';
import '../../data/models/all_categories_model/all_categories_model.dart';
import '../../logic/all_categories/all_categories_cubit.dart';
import '../../logic/all_categories/all_categories_state.dart';
import '../widgets/custom_categories_list_tile.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});

  final List<String> categoriesImage = [
    'assets/icons/man_shirt.svg',
    'assets/icons/woman_dress.svg',
    'assets/icons/man_t_shirt.svg',
    'assets/icons/children_cloths.svg',
    'assets/icons/man_shoes.svg',
    'assets/icons/man_pants.svg',
    'assets/icons/woman_t_shirt.svg',
    'assets/icons/woman_pants.svg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      appBar: const CustomAppBar(title: 'All Categories'),
      body: BlocBuilder<
        AllCategoriesCubit,
        AllCategoriesState<List<AllCategoriesModel>>
      >(
        builder: (context, state) {
          return state.when(
            idle: () => const Center(child: CustomProgressIndicator()),
            loading: () => const Center(child: CustomProgressIndicator()),
            success: (data) {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(vertical: 14.r),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  String imageSrc = getImageForCategory(index);
                  return CustomCategoriesListTile(
                    title: data[index].name ?? '',
                    subTitle: data[index].description ?? '',
                    imageSrc: imageSrc,
                    press: () {
                      masterCategoryId = data[index].id ?? '';
                      masterCategoryName = data[index].name ?? '';
                      context.pushNamed(Routes.categoryProductsList);
                    },
                  );
                },
              );
            },
            error: (errorMsg) {
              return Center(
                child: Text(
                  errorMsg.toString(),
                  style: TextStyle(
                    color: AppColors.kTextColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  String getImageForCategory(int index) {
    if (index < 5) {
      return categoriesImage[index];
    } else {
      return categoriesImage[Random().nextInt(categoriesImage.length)];
    }
  }
}
