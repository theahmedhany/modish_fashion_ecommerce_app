import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/networking/api_error_model.dart';
import '../../../core/networking/api_network_exceptions.dart';
import '../data/models/product_details_model.dart';
import '../data/repos/product_details_repo.dart';
import 'product_details_state.dart';

class ProductDetailsCubit
    extends Cubit<ProductDetailsState<ProductDetailsModel>> {
  final ProductDetailsRepo productDetailsRepo;

  ProductDetailsCubit(this.productDetailsRepo) : super(const Idle());

  void emitGetProductDetails(String productId) async {
    var data = await productDetailsRepo.getProductDetails(productId);
    data.when(
      success: (ProductDetailsModel productDetails) {
        emit(ProductDetailsState.success(productDetails));
      },
      failure: (ApiErrorModel apiError) {
        emit(ProductDetailsState.error(apiError as ApiNetworkExceptions));
      },
    );
  }
}
