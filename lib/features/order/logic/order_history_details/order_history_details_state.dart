import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/api_network_exceptions.dart';

part 'order_history_details_state.freezed.dart';

@freezed
class OrderHistoryDetailsState<T> with _$OrderHistoryDetailsState<T> {
  const factory OrderHistoryDetailsState.idle() = Idle<T>;

  const factory OrderHistoryDetailsState.loading() = Loading<T>;

  const factory OrderHistoryDetailsState.success(T data) = Success<T>;

  const factory OrderHistoryDetailsState.error(
    ApiNetworkExceptions networkExceptions,
  ) = Error<T>;
}
