import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_error_model.dart';
import '../../../../core/networking/api_network_exceptions.dart';
import '../../data/models/category_model/category_model.dart';
import '../../data/repos/category_repo.dart';
import 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState<CategoryModel>> {
  final CategoryRepo categoryRepo;
  int currentPage = 1;
  final int pageSize = 10;

  bool hasReachedMax = false;
  bool isLoadingMore = false;
  List<CategoryData> allProducts = [];

  CategoryCubit(this.categoryRepo) : super(const Idle());

  Future<void> emitGetAllProductsByCategory({
    bool isInitialLoad = true,
    required String categoryId,
  }) async {
    if ((isLoadingMore || hasReachedMax) && !isInitialLoad) return;

    isLoadingMore = true;

    if (isInitialLoad) {
      emit(const CategoryState.loading());
      currentPage = 1;
      hasReachedMax = false;
      allProducts.clear();
    }

    var data = await categoryRepo.getProductsByCategory(
      currentPage,
      pageSize,
      categoryId,
    );

    data.when(
      success: (CategoryModel newProducts) {
        if (isInitialLoad) {
          allProducts = newProducts.data ?? [];
        } else {
          allProducts.addAll(newProducts.data ?? []);
        }

        hasReachedMax = (newProducts.data?.length ?? 0) < pageSize;
        currentPage++;

        emit(
          CategoryState.success(
            CategoryModel(data: List<CategoryData>.from(allProducts)),
          ),
        );
        isLoadingMore = false;
      },
      failure: (ApiErrorModel errorModel) {
        emit(CategoryState.error(errorModel as ApiNetworkExceptions));
        isLoadingMore = false;
      },
    );
  }
}
