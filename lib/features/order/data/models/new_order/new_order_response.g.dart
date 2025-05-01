// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShippingAddress _$ShippingAddressFromJson(Map<String, dynamic> json) =>
    ShippingAddress(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      street: json['street'] as String,
      city: json['city'] as String,
      countrty: json['countrty'] as String,
    );

Map<String, dynamic> _$ShippingAddressToJson(ShippingAddress instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'street': instance.street,
      'city': instance.city,
      'countrty': instance.countrty,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
  productId: json['productId'] as String,
  productName: json['productName'] as String,
  productUrl: json['productUrl'] as String,
);

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
  'productId': instance.productId,
  'productName': instance.productName,
  'productUrl': instance.productUrl,
};

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) => OrderItem(
  id: json['id'] as String,
  product: Product.fromJson(json['product'] as Map<String, dynamic>),
  price: (json['price'] as num).toDouble(),
  quantity: (json['quantity'] as num).toInt(),
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$OrderItemToJson(OrderItem instance) => <String, dynamic>{
  'id': instance.id,
  'product': instance.product,
  'price': instance.price,
  'quantity': instance.quantity,
  'createdAt': instance.createdAt.toIso8601String(),
};

NewOrderResponse _$NewOrderResponseFromJson(Map<String, dynamic> json) =>
    NewOrderResponse(
      id: json['id'] as String,
      appUserId: json['appUserId'] as String,
      orderDate: DateTime.parse(json['orderDate'] as String),
      status: json['status'] as String,
      shippingAddress: ShippingAddress.fromJson(
        json['shippingAddress'] as Map<String, dynamic>,
      ),
      deliveryMethod: json['deliveryMethod'] as String,
      deliveryMethodCost: (json['deliveryMethodCost'] as num).toDouble(),
      items:
          (json['items'] as List<dynamic>)
              .map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
              .toList(),
      subTotal: (json['subTotal'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
    );

Map<String, dynamic> _$NewOrderResponseToJson(NewOrderResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'appUserId': instance.appUserId,
      'orderDate': instance.orderDate.toIso8601String(),
      'status': instance.status,
      'shippingAddress': instance.shippingAddress,
      'deliveryMethod': instance.deliveryMethod,
      'deliveryMethodCost': instance.deliveryMethodCost,
      'items': instance.items,
      'subTotal': instance.subTotal,
      'total': instance.total,
    };
