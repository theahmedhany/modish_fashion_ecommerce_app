// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderHistoryModel _$OrderHistoryModelFromJson(Map<String, dynamic> json) =>
    OrderHistoryModel(
      orderId: json['orderId'] as String?,
      status: json['status'] as String?,
      deliveryMethod: json['deliveryMethod'] as String?,
      total: (json['total'] as num?)?.toDouble(),
      paymentMethod: json['paymentMethod'] as String?,
    );

Map<String, dynamic> _$OrderHistoryModelToJson(OrderHistoryModel instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'status': instance.status,
      'deliveryMethod': instance.deliveryMethod,
      'total': instance.total,
      'paymentMethod': instance.paymentMethod,
    };
