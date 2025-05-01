// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsModel _$ProductsModelFromJson(Map<String, dynamic> json) =>
    ProductsModel(
      pageSize: (json['pageSize'] as num?)?.toInt(),
      pageIndex: (json['pageIndex'] as num?)?.toInt(),
      count: (json['count'] as num?)?.toInt(),
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => ProductData.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$ProductsModelToJson(ProductsModel instance) =>
    <String, dynamic>{
      'pageSize': instance.pageSize,
      'pageIndex': instance.pageIndex,
      'count': instance.count,
      'data': instance.data,
    };

ProductData _$ProductDataFromJson(Map<String, dynamic> json) => ProductData(
  productId: json['productId'] as String?,
  name: json['name'] as String?,
  pictureUrl: json['pictureUrl'] as String?,
  size: json['size'] as String?,
  stockQuantity: (json['stockQuantity'] as num?)?.toInt(),
  price: (json['price'] as num?)?.toDouble(),
  categoryId: json['categoryId'] as String?,
  categoryName: json['categoryName'] as String?,
  rate: (json['rate'] as num?)?.toInt(),
);

Map<String, dynamic> _$ProductDataToJson(ProductData instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'name': instance.name,
      'pictureUrl': instance.pictureUrl,
      'size': instance.size,
      'stockQuantity': instance.stockQuantity,
      'price': instance.price,
      'categoryId': instance.categoryId,
      'categoryName': instance.categoryName,
      'rate': instance.rate,
    };
