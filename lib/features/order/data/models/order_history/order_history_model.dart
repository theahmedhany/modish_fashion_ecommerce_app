import 'package:json_annotation/json_annotation.dart';

part 'order_history_model.g.dart';

@JsonSerializable()
class OrderHistoryModel {
  String? orderId;
  String? status;
  String? deliveryMethod;
  double? total;
  String? paymentMethod;

  OrderHistoryModel({
    this.orderId,
    this.status,
    this.deliveryMethod,
    this.total,
    this.paymentMethod,
  });

  factory OrderHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$OrderHistoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderHistoryModelToJson(this);
}
