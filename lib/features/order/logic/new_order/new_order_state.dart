import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_order_state.freezed.dart';

@freezed
class NewOrderState<T> with _$NewOrderState<T> {
  const factory NewOrderState.idle() = Idle<T>;

  const factory NewOrderState.loading() = Loading;
  const factory NewOrderState.success(T data) = Success<T>;
  const factory NewOrderState.error({required String error}) = Error;
}
