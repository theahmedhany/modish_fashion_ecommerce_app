// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderHistoryResponse _$OrderHistoryResponseFromJson(
  Map<String, dynamic> json,
) => OrderHistoryResponse(
  orders:
      (json['orders'] as List<dynamic>)
          .map((e) => OrderHistoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  page: (json['page'] as num).toInt(),
  pageSize: (json['pageSize'] as num).toInt(),
  totalCount: (json['totalCount'] as num).toInt(),
  totalPages: (json['totalPages'] as num).toInt(),
);

Map<String, dynamic> _$OrderHistoryResponseToJson(
  OrderHistoryResponse instance,
) => <String, dynamic>{
  'orders': instance.orders,
  'page': instance.page,
  'pageSize': instance.pageSize,
  'totalCount': instance.totalCount,
  'totalPages': instance.totalPages,
};

OrderHistoryModel _$OrderHistoryModelFromJson(Map<String, dynamic> json) =>
    OrderHistoryModel(
      orderId: json['orderId'] as String?,
      status: json['status'] as String?,
      deliveryMethod: json['deliveryMethod'] as String?,
      total: (json['total'] as num?)?.toDouble(),
      paymentMethod: json['paymentMethod'] as String?,
      orderCreatedAt: json['orderCreatedAt'] as String?,
      numberOfProductsItems: (json['numberOfProductsItems'] as num?)?.toInt(),
    );

Map<String, dynamic> _$OrderHistoryModelToJson(OrderHistoryModel instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'status': instance.status,
      'deliveryMethod': instance.deliveryMethod,
      'total': instance.total,
      'paymentMethod': instance.paymentMethod,
      'orderCreatedAt': instance.orderCreatedAt,
      'numberOfProductsItems': instance.numberOfProductsItems,
    };
