import 'package:json_annotation/json_annotation.dart';

part 'order_history_model.g.dart';

@JsonSerializable()
class OrderHistoryResponse {
  final List<OrderHistoryModel> orders;
  final int page;
  final int pageSize;
  final int totalCount;
  final int totalPages;

  OrderHistoryResponse({
    required this.orders,
    required this.page,
    required this.pageSize,
    required this.totalCount,
    required this.totalPages,
  });

  factory OrderHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderHistoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OrderHistoryResponseToJson(this);
}

@JsonSerializable()
class OrderHistoryModel {
  String? orderId;
  String? status;
  String? deliveryMethod;
  double? total;
  String? paymentMethod;
  String? orderCreatedAt;
  int? numberOfProductsItems;

  OrderHistoryModel({
    this.orderId,
    this.status,
    this.deliveryMethod,
    this.total,
    this.paymentMethod,
    this.orderCreatedAt,
    this.numberOfProductsItems,
  });

  factory OrderHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$OrderHistoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderHistoryModelToJson(this);
}
