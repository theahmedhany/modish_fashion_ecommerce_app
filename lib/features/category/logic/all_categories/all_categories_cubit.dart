import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_error_model.dart';
import '../../../../core/networking/api_network_exceptions.dart';
import '../../data/models/all_categories_model/all_categories_model.dart';
import '../../data/repos/all_categories_repo.dart';
import 'all_categories_state.dart';

class AllCategoriesCubit
    extends Cubit<AllCategoriesState<List<AllCategoriesModel>>> {
  final AllCategoriesRepo allCategoriesRepo;

  AllCategoriesCubit(this.allCategoriesRepo) : super(const Idle());

  void emitGetAllCategories() async {
    var data = await allCategoriesRepo.getAllCategories();

    data.when(
      success: (List<AllCategoriesModel> allCategoriesList) {
        emit(AllCategoriesState.success(allCategoriesList));
      },
      failure: (ApiErrorModel apiErrorModel) {
        emit(AllCategoriesState.error(apiErrorModel as ApiNetworkExceptions));
      },
    );
  }
}
