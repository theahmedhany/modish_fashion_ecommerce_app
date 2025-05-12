import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/api_error_model.dart';

part 'order_history_state.freezed.dart';

@freezed
class OrderHistoryState<T> with _$OrderHistoryState<T> {
  const factory OrderHistoryState.idle() = Idle<T>;

  const factory OrderHistoryState.loading() = Loading<T>;

  const factory OrderHistoryState.success(T data) = Success<T>;

  const factory OrderHistoryState.error(ApiErrorModel errorModel) = Error<T>;
}
