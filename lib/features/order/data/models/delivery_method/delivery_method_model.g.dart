// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_method_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeliveryMethodModel _$DeliveryMethodModelFromJson(Map<String, dynamic> json) =>
    DeliveryMethodModel(
      shortName: json['shortName'] as String?,
      description: json['description'] as String?,
      deliveryTime: json['deliveryTime'] as String?,
      cost: (json['cost'] as num?)?.toInt(),
      id: json['id'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$DeliveryMethodModelToJson(
  DeliveryMethodModel instance,
) => <String, dynamic>{
  'shortName': instance.shortName,
  'description': instance.description,
  'deliveryTime': instance.deliveryTime,
  'cost': instance.cost,
  'id': instance.id,
  'createdAt': instance.createdAt,
};
