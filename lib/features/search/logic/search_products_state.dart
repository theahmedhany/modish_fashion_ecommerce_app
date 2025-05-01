import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/networking/api_network_exceptions.dart';

part 'search_products_state.freezed.dart';

@freezed
class SearchProductsState<T> with _$SearchProductsState<T> {
  const factory SearchProductsState.idle() = Idle<T>;

  const factory SearchProductsState.loading() = Loading<T>;

  const factory SearchProductsState.success(T data) = Success<T>;

  const factory SearchProductsState.error(
    ApiNetworkExceptions networkExceptions,
  ) = Error<T>;
}
