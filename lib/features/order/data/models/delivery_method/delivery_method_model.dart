import 'package:json_annotation/json_annotation.dart';

part 'delivery_method_model.g.dart';

@JsonSerializable()
class DeliveryMethodModel {
  String? shortName;
  String? description;
  String? deliveryTime;
  int? cost;
  String? id;
  String? createdAt;

  DeliveryMethodModel({
    this.shortName,
    this.description,
    this.deliveryTime,
    this.cost,
    this.id,
    this.createdAt,
  });

  factory DeliveryMethodModel.fromJson(Map<String, dynamic> json) =>
      _$DeliveryMethodModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeliveryMethodModelToJson(this);
}
