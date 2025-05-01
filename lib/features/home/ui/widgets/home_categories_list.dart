import 'package:flutter/material.dart';

import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';
import 'category_list_card.dart';

class HomeCategoriesList extends StatelessWidget {
  const HomeCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CategoryListCard(
            press: () {
              masterCategoryName = 'Men\'s Clothing';
              masterCategoryId = 'a1b2c3d4-e5f6-4a7b-8c9d-0e1f2a3b4c5d';
              context.pushNamed(Routes.categoryProductsList);
            },
            categoryTitle: 'Men\'s',
            categoryImage: 'assets/icons/man_shirt.svg',
          ),
          CategoryListCard(
            press: () {
              masterCategoryName = 'Women\'s Clothing';
              masterCategoryId = 'b2c3d4e5-f6a7-4b8c-9d0e-1f2a3b4c5d6e';
              context.pushNamed(Routes.categoryProductsList);
            },
            categoryTitle: 'Women\'s',
            categoryImage: 'assets/icons/woman_dress.svg',
          ),
          CategoryListCard(
            press: () {
              masterCategoryName = 'Teen Clothing';
              masterCategoryId = 'd4e5f6a7-b8c9-4d0e-1f2a-3b4c5d6e7f8g';
              context.pushNamed(Routes.categoryProductsList);
            },
            categoryTitle: 'Teen',
            categoryImage: 'assets/icons/man_t_shirt.svg',
          ),
          CategoryListCard(
            press: () {
              masterCategoryName = 'Children\'s Clothing';
              masterCategoryId = 'c3d4e5f6-a7b8-4c9d-0e1f-2a3b4c5d6e7f';
              context.pushNamed(Routes.categoryProductsList);
            },
            categoryTitle: 'Children\'s',
            categoryImage: 'assets/icons/children_cloths.svg',
          ),
        ],
      ),
    );
  }
}
