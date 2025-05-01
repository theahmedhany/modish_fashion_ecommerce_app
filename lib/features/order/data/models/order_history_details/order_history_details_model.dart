import 'package:json_annotation/json_annotation.dart';

part 'order_history_details_model.g.dart';

@JsonSerializable()
class OrderHistoryDetailsModel {
  String? appUserId;
  String? orderDate;
  String? status;
  ShippingAddress? shippingAddress;
  String? deliveryMethodId;
  List<Items>? items;
  double? subTotal;
  double? total;
  String? paymentMethod;

  OrderHistoryDetailsModel({
    this.appUserId,
    this.orderDate,
    this.status,
    this.shippingAddress,
    this.deliveryMethodId,
    this.items,
    this.subTotal,
    this.total,
    this.paymentMethod,
  });

  factory OrderHistoryDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$OrderHistoryDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderHistoryDetailsModelToJson(this);
}

@JsonSerializable()
class ShippingAddress {
  String? firstName;
  String? lastName;
  String? street;
  String? city;
  String? Country;

  ShippingAddress({
    this.firstName,
    this.lastName,
    this.street,
    this.city,
    this.Country,
  });

  factory ShippingAddress.fromJson(Map<String, dynamic> json) =>
      _$ShippingAddressFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingAddressToJson(this);
}

@JsonSerializable()
class Items {
  Product? product;
  int? price;
  int? quantity;
  String? id;
  String? createdAt;

  Items({this.product, this.price, this.quantity, this.id, this.createdAt});

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}

@JsonSerializable()
class Product {
  String? productId;
  String? productName;
  String? productUrl;

  Product({this.productId, this.productName, this.productUrl});

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
