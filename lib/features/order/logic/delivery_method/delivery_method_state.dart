import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/api_network_exceptions.dart';

part 'delivery_method_state.freezed.dart';

@freezed
class DeliveryMethodState<T> with _$DeliveryMethodState<T> {
  const factory DeliveryMethodState.idle() = Idle<T>;

  const factory DeliveryMethodState.loading() = Loading<T>;

  const factory DeliveryMethodState.success(T data) = Success<T>;

  const factory DeliveryMethodState.error(
    ApiNetworkExceptions networkExceptions,
  ) = Error<T>;
}
