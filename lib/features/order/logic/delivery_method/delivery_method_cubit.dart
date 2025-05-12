import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_error_model.dart';
import '../../../../core/networking/api_network_exceptions.dart';
import '../../data/models/delivery_method/delivery_method_model.dart';
import '../../data/repos/delivery_method_repo.dart';
import 'delivery_method_state.dart';

class DeliveryMethodCubit
    extends Cubit<DeliveryMethodState<List<DeliveryMethodModel>>> {
  final DeliveryMethodRepo deliveryMethodRepo;

  DeliveryMethodCubit(this.deliveryMethodRepo) : super(const Idle());

  void emitGetDeliveryMethods() async {
    var data = await deliveryMethodRepo.getDeliveryMethods();

    data.when(
      success: (List<DeliveryMethodModel> allDeliveryMethods) {
        emit(DeliveryMethodState.success(allDeliveryMethods));
      },
      failure: (ApiErrorModel apiErrorModel) {
        emit(DeliveryMethodState.error(apiErrorModel as ApiNetworkExceptions));
      },
    );
  }
}
