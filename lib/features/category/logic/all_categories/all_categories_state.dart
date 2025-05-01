import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/api_network_exceptions.dart';

part 'all_categories_state.freezed.dart';

@freezed
class AllCategoriesState<T> with _$AllCategoriesState<T> {
  const factory AllCategoriesState.idle() = Idle<T>;

  const factory AllCategoriesState.loading() = Loading<T>;

  const factory AllCategoriesState.success(T data) = Success<T>;

  const factory AllCategoriesState.error(
    ApiNetworkExceptions networkExceptions,
  ) = Error<T>;
}
