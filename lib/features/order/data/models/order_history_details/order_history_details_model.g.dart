// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_history_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderHistoryDetailsModel _$OrderHistoryDetailsModelFromJson(
  Map<String, dynamic> json,
) => OrderHistoryDetailsModel(
  appUserId: json['appUserId'] as String?,
  orderDate: json['orderDate'] as String?,
  status: json['status'] as String?,
  shippingAddress:
      json['shippingAddress'] == null
          ? null
          : ShippingAddress.fromJson(
            json['shippingAddress'] as Map<String, dynamic>,
          ),
  deliveryMethodId: json['deliveryMethodId'] as String?,
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => Items.fromJson(e as Map<String, dynamic>))
          .toList(),
  subTotal: (json['subTotal'] as num?)?.toDouble(),
  total: (json['total'] as num?)?.toDouble(),
  paymentMethod: json['paymentMethod'] as String?,
);

Map<String, dynamic> _$OrderHistoryDetailsModelToJson(
  OrderHistoryDetailsModel instance,
) => <String, dynamic>{
  'appUserId': instance.appUserId,
  'orderDate': instance.orderDate,
  'status': instance.status,
  'shippingAddress': instance.shippingAddress,
  'deliveryMethodId': instance.deliveryMethodId,
  'items': instance.items,
  'subTotal': instance.subTotal,
  'total': instance.total,
  'paymentMethod': instance.paymentMethod,
};

ShippingAddress _$ShippingAddressFromJson(Map<String, dynamic> json) =>
    ShippingAddress(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      street: json['street'] as String?,
      city: json['city'] as String?,
      Country: json['Country'] as String?,
    );

Map<String, dynamic> _$ShippingAddressToJson(ShippingAddress instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'street': instance.street,
      'city': instance.city,
      'Country': instance.Country,
    };

Items _$ItemsFromJson(Map<String, dynamic> json) => Items(
  id: json['id'] as String?,
  product:
      json['product'] == null
          ? null
          : Product.fromJson(json['product'] as Map<String, dynamic>),
  price: (json['price'] as num?)?.toInt(),
  quantity: (json['quantity'] as num?)?.toInt(),
  createdAt: json['createdAt'] as String?,
);

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
  'id': instance.id,
  'product': instance.product,
  'price': instance.price,
  'quantity': instance.quantity,
  'createdAt': instance.createdAt,
};

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
  productId: json['productId'] as String?,
  productName: json['productName'] as String?,
  productUrl: json['productUrl'] as String?,
);

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
  'productId': instance.productId,
  'productName': instance.productName,
  'productUrl': instance.productUrl,
};
