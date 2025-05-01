import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/api_network_exceptions.dart';

part 'category_state.freezed.dart';

@freezed
class CategoryState<T> with _$CategoryState<T> {
  const factory CategoryState.idle() = Idle<T>;

  const factory CategoryState.loading() = Loading<T>;

  const factory CategoryState.success(T data) = Success<T>;

  const factory CategoryState.error(ApiNetworkExceptions networkExceptions) =
      Error<T>;
}
