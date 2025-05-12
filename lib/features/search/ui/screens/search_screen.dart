import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';
import '../../../../core/widgets/custom_main_app_bar.dart';
import '../../../../core/widgets/custom_progress_indicator.dart';
import '../../data/models/search_products_model.dart';
import '../../logic/search_products_cubit.dart';
import '../../logic/search_products_state.dart';
import '../widgets/no_products_available.dart';
import '../widgets/search_custom_product_card.dart';
import '../widgets/search_main_bar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.scaffoldKey});

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchQuery = '';
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    context.read<SearchProductsCubit>().resetToInitialState();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      setState(() {
        searchQuery = query;
      });

      if (query.isNotEmpty) {
        context.read<SearchProductsCubit>().getProductsBySearch(
          searchedProduct: query,
        );
      } else {
        context.read<SearchProductsCubit>().resetToInitialState();
      }
    });
  }

  void _onClearSearch() {
    setState(() {
      searchQuery = '';
    });
    context.read<SearchProductsCubit>().resetToInitialState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kBackgroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(14),
            CustomMainAppBar(scaffoldKey: widget.scaffoldKey, title: 'Search'),
            verticalSpace(30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.r),
              child: SearchMainBar(
                onSearchChanged: _onSearchChanged,
                onClearSearch: _onClearSearch,
              ),
            ),
            verticalSpace(30),
            Expanded(
              child: BlocBuilder<
                SearchProductsCubit,
                SearchProductsState<SearchProductsModel>
              >(
                builder: (context, state) {
                  return state.when(
                    loading: () => const CustomProgressIndicator(),
                    success: (products) {
                      if (products.data == null || products.data!.isEmpty) {
                        return const NoProductsAvailable();
                      }
                      return _buildProductGrid(products.data!);
                    },
                    error: (error) => Center(child: Text('Error: $error')),
                    idle:
                        () => Center(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SvgPicture.asset(
                                  width: 350.r,
                                  height: 350.r,
                                  'assets/icons/start_search.svg',
                                ),
                                Text(
                                  'Start searching now!',
                                  style: AppFonts.font18DarkRegular,
                                ),
                                verticalSpace(80),
                              ],
                            ),
                          ),
                        ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductGrid(List<SearchProductsData> products) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.r),
      child: GridView.builder(
        padding: EdgeInsets.only(bottom: 26.r),
        physics: const BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          mainAxisExtent: MediaQuery.of(context).size.height * 0.28,
        ),
        itemCount: products.length,
        itemBuilder: (_, index) {
          final product = products[index];
          return CustomSearchProductCard(
            imageSrc: product.pictureUrl ?? '',
            title: product.name ?? 'Unknown',
            price: '\$${product.price ?? 'N/A'}',
            press: () {
              productDetailsId = product.productId!;
              context.pushNamed(Routes.detailsScreen);
            },
          );
        },
      ),
    );
  }
}
