import 'package:json_annotation/json_annotation.dart';

part 'new_order_response.g.dart';

@JsonSerializable()
class ShippingAddress {
  final String firstName;
  final String lastName;
  final String street;
  final String city;
  final String countrty;

  ShippingAddress({
    required this.firstName,
    required this.lastName,
    required this.street,
    required this.city,
    required this.countrty,
  });

  factory ShippingAddress.fromJson(Map<String, dynamic> json) =>
      _$ShippingAddressFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingAddressToJson(this);
}

@JsonSerializable()
class Product {
  final String productId;
  final String productName;
  final String productUrl;

  Product({
    required this.productId,
    required this.productName,
    required this.productUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

@JsonSerializable()
class OrderItem {
  final String id;
  final Product product;
  final double price;
  final int quantity;
  final DateTime createdAt;

  OrderItem({
    required this.id,
    required this.product,
    required this.price,
    required this.quantity,
    required this.createdAt,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemToJson(this);
}

@JsonSerializable()
class NewOrderResponse {
  final String id;
  final String appUserId;
  final DateTime orderDate;
  final String status;
  final ShippingAddress shippingAddress;
  final String deliveryMethod;
  final double deliveryMethodCost;
  final List<OrderItem> items;
  final double subTotal;
  final double total;

  NewOrderResponse({
    required this.id,
    required this.appUserId,
    required this.orderDate,
    required this.status,
    required this.shippingAddress,
    required this.deliveryMethod,
    required this.deliveryMethodCost,
    required this.items,
    required this.subTotal,
    required this.total,
  });

  factory NewOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$NewOrderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NewOrderResponseToJson(this);
}
