import 'package:json_annotation/json_annotation.dart';

part 'new_order_request_body.g.dart';

@JsonSerializable()
class NewOrderRequestBody {
  final String appUserId;
  final String deliveryMethodId;
  final ShippingAddress shippingAddress;
  final String productId;

  NewOrderRequestBody({
    required this.appUserId,
    required this.deliveryMethodId,
    required this.shippingAddress,
    required this.productId,
  });

  factory NewOrderRequestBody.fromJson(Map<String, dynamic> json) =>
      _$NewOrderRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$NewOrderRequestBodyToJson(this);
}

@JsonSerializable()
class ShippingAddress {
  final String firstName;
  final String lastName;
  final String street;
  final String city;
  final String Country;

  ShippingAddress({
    required this.firstName,
    required this.lastName,
    required this.street,
    required this.city,
    required this.Country,
  });

  factory ShippingAddress.fromJson(Map<String, dynamic> json) =>
      _$ShippingAddressFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingAddressToJson(this);
}
