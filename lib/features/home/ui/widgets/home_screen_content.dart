import 'package:flutter/material.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/custom_main_app_bar.dart';
import 'custom_options_row.dart';
import 'feature_products_list_view.dart';
import 'home_categories_list.dart';
import 'home_top_image.dart';
import 'new_collection_container.dart';
import 'recommended_products_list_view.dart';
import 'top_collection_container.dart';

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key, required this.scaffoldKey});

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          verticalSpace(14),
          CustomMainAppBar(scaffoldKey: scaffoldKey, title: 'Modish'),
          verticalSpace(24),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  HomeTopImage(),
                  verticalSpace(22),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CustomOptionsRow(
                      press: () {
                        context.pushNamed(Routes.categoryScreen);
                      },
                      optionTitle: 'Category',
                    ),
                  ),
                  verticalSpace(16),
                  HomeCategoriesList(),
                  verticalSpace(22),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CustomOptionsRow(
                      press: () {
                        context.pushNamed(Routes.productsScreen);
                      },
                      optionTitle: 'Feature Products',
                    ),
                  ),
                  verticalSpace(16),
                  const FeatureProductsListView(),
                  verticalSpace(24),
                  NewCollectionContainer(),
                  verticalSpace(24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CustomOptionsRow(
                      press: () {
                        context.pushNamed(Routes.productsScreen);
                      },
                      optionTitle: 'Recommended',
                    ),
                  ),
                  verticalSpace(16),
                  RecommendedProductsListView(),
                  verticalSpace(24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CustomOptionsRow(
                      press: () {
                        context.pushNamed(Routes.productsScreen);
                      },
                      optionTitle: 'Top Collections',
                    ),
                  ),
                  verticalSpace(16),
                  TopCollectionContainer(
                    height: 145,
                    circleRadius: 100,
                    header: 'Sale up to 40%',
                    content: 'FOR SLIM\n& BEAUTY',
                    image: 'assets/images/model_1.png',
                    paddingValue: 40,
                  ),
                  verticalSpace(24),
                  TopCollectionContainer(
                    height: 210,
                    circleRadius: 110,
                    header: 'Summer Collection 2025',
                    content: 'Most Comfortable\n& fabulous\ndesign ',
                    image: 'assets/images/model_2.png',
                    paddingValue: 20,
                  ),
                  verticalSpace(30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
