import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/networking/api_error_model.dart';

part 'product_details_state.freezed.dart';

@freezed
class ProductDetailsState<T> with _$ProductDetailsState<T> {
  const factory ProductDetailsState.idle() = Idle<T>;

  const factory ProductDetailsState.loading() = Loading<T>;

  const factory ProductDetailsState.success(T data) = Success<T>;

  const factory ProductDetailsState.error(ApiErrorModel networkExceptions) =
      Error<T>;
}
