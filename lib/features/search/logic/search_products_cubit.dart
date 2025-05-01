import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/networking/api_error_model.dart';
import '../../../core/networking/api_network_exceptions.dart';
import '../data/models/search_products_model.dart';
import '../data/repos/search_products_repo.dart';
import 'search_products_state.dart';

class SearchProductsCubit
    extends Cubit<SearchProductsState<SearchProductsModel>> {
  final SearchProductsRepo searchProductsRepo;
  int currentPage = 1;
  final int pageSize = 10;

  bool hasReachedMax = false;
  bool isLoadingMore = false;
  List<SearchProductsData> allSearchedProducts = [];

  SearchProductsCubit(this.searchProductsRepo) : super(const Idle());

  void resetToInitialState() {
    emit(const SearchProductsState.idle());
  }

  Future<void> getProductsBySearch({
    bool isInitialLoad = true,
    required String searchedProduct,
  }) async {
    if ((isLoadingMore || hasReachedMax) && !isInitialLoad) return;

    isLoadingMore = true;

    if (isInitialLoad) {
      emit(const SearchProductsState.loading());
      currentPage = 1;
      hasReachedMax = false;
      allSearchedProducts.clear();
    }

    var data = await searchProductsRepo.getProductsBySearch(
      currentPage,
      pageSize,
      searchedProduct,
    );

    data.when(
      success: (SearchProductsModel newSearchedProducts) {
        if (isInitialLoad) {
          allSearchedProducts = newSearchedProducts.data ?? [];
        } else {
          allSearchedProducts.addAll(newSearchedProducts.data ?? []);
        }

        hasReachedMax = (newSearchedProducts.data?.length ?? 0) < pageSize;
        currentPage++;

        emit(
          SearchProductsState.success(
            SearchProductsModel(
              data: List<SearchProductsData>.from(allSearchedProducts),
            ),
          ),
        );
        isLoadingMore = false;
      },
      failure: (ApiErrorModel errorModel) {
        emit(SearchProductsState.error(errorModel as ApiNetworkExceptions));
        isLoadingMore = false;
      },
    );
  }
}
