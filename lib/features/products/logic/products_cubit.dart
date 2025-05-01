import 'package:bloc/bloc.dart';

import '../../../core/networking/api_error_model.dart';
import '../../../core/networking/api_network_exceptions.dart';
import '../data/models/products_model.dart';
import '../data/repos/products_repo.dart';
import 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState<ProductsModel>> {
  final ProductsRepo productsRepo;
  int currentPage = 1;
  final int pageSize = 10;
  bool hasReachedMax = false;
  bool isLoadingMore = false;
  List<ProductData> allProducts = [];

  ProductsCubit(this.productsRepo) : super(const Idle());

  Future<void> emitGetAllProducts({bool isInitialLoad = true}) async {
    if ((isLoadingMore || hasReachedMax) && !isInitialLoad) return;

    isLoadingMore = true;

    if (isInitialLoad) {
      emit(const ProductsState.loading());
      currentPage = 1;
      hasReachedMax = false;
      allProducts.clear();
    }

    var data = await productsRepo.getProducts(currentPage, pageSize);

    data.when(
      success: (ProductsModel newProducts) {
        if (isInitialLoad) {
          allProducts = newProducts.data ?? [];
        } else {
          allProducts.addAll(newProducts.data ?? []);
        }

        hasReachedMax = (newProducts.data?.length ?? 0) < pageSize;
        currentPage++;

        emit(
          ProductsState.success(
            ProductsModel(data: List<ProductData>.from(allProducts)),
          ),
        );
        isLoadingMore = false;
      },
      failure: (ApiErrorModel errorModel) {
        emit(ProductsState.error(errorModel as ApiNetworkExceptions));
        isLoadingMore = false;
      },
    );
  }
}
