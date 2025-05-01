import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/networking/api_network_exceptions.dart';

part 'products_state.freezed.dart';

@freezed
class ProductsState<T> with _$ProductsState<T> {
  const factory ProductsState.idle() = Idle<T>;

  const factory ProductsState.loading() = Loading<T>;

  const factory ProductsState.success(T data) = Success<T>;

  const factory ProductsState.error(ApiNetworkExceptions networkExceptions) =
      Error<T>;
}
