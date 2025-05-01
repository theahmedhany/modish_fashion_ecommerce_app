import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
import '../../data/models/new_order/new_order_request_body.dart';
import '../../data/repos/new_order_repo.dart';

import 'new_order_state.dart';

class NewOrderCubit extends Cubit<NewOrderState> {
  final NewOrderRepo _newOrderRepo;
  NewOrderCubit(this._newOrderRepo) : super(const NewOrderState.idle());

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController streetNameController = TextEditingController();
  TextEditingController cityNameController = TextEditingController();
  TextEditingController countryNameController = TextEditingController();

  TextEditingController deliveryMethodIdController = TextEditingController();
  TextEditingController productIdController = TextEditingController();
  TextEditingController appUserIdController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void emitNewOrder(String orderProductId) async {
    if (!formKey.currentState!.validate()) return;

    emit(const NewOrderState.loading());
    try {
      final appUserId = await SharedPrefHelper.getString(
        SharedPrefKeys.appUserId,
      );

      final response = await _newOrderRepo.newOrder(
        NewOrderRequestBody(
          appUserId: appUserId, // appUserIdController.text
          deliveryMethodId: deliveryMethodIdController.text,
          productId: orderProductId, // productIdController.text
          shippingAddress: ShippingAddress(
            firstName: firstNameController.text,
            lastName: lastNameController.text,
            street: streetNameController.text,
            city: cityNameController.text,
            Country: countryNameController.text,
          ),
        ),
      );

      response.when(
        success: (newOrderResponse) async {
          emit(NewOrderState.success(newOrderResponse));
        },
        failure: (error) {
          emit(
            NewOrderState.error(
              error:
                  error.message ??
                  "An unexpected error occurred. Please try again.",
            ),
          );
        },
      );
    } catch (e) {
      emit(
        NewOrderState.error(
          error: "An unexpected error occurred. Please try again.",
        ),
      );
    }
  }

  @override
  Future<void> close() {
    firstNameController.dispose();
    lastNameController.dispose();
    streetNameController.dispose();
    cityNameController.dispose();
    countryNameController.dispose();
    deliveryMethodIdController.dispose();
    productIdController.dispose();
    appUserIdController.dispose();
    return super.close();
  }
}
