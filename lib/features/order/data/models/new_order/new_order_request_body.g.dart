// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_order_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewOrderRequestBody _$NewOrderRequestBodyFromJson(Map<String, dynamic> json) =>
    NewOrderRequestBody(
      appUserId: json['appUserId'] as String,
      deliveryMethodId: json['deliveryMethodId'] as String,
      shippingAddress: ShippingAddress.fromJson(
        json['shippingAddress'] as Map<String, dynamic>,
      ),
      productId: json['productId'] as String,
    );

Map<String, dynamic> _$NewOrderRequestBodyToJson(
  NewOrderRequestBody instance,
) => <String, dynamic>{
  'appUserId': instance.appUserId,
  'deliveryMethodId': instance.deliveryMethodId,
  'shippingAddress': instance.shippingAddress,
  'productId': instance.productId,
};

ShippingAddress _$ShippingAddressFromJson(Map<String, dynamic> json) =>
    ShippingAddress(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      street: json['street'] as String,
      city: json['city'] as String,
      Country: json['Country'] as String,
    );

Map<String, dynamic> _$ShippingAddressToJson(ShippingAddress instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'street': instance.street,
      'city': instance.city,
      'Country': instance.Country,
    };
