// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      pageSize: (json['pageSize'] as num?)?.toInt(),
      pageIndex: (json['pageIndex'] as num?)?.toInt(),
      count: (json['count'] as num?)?.toInt(),
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => CategoryData.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'pageSize': instance.pageSize,
      'pageIndex': instance.pageIndex,
      'count': instance.count,
      'data': instance.data,
    };

CategoryData _$CategoryDataFromJson(Map<String, dynamic> json) => CategoryData(
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

Map<String, dynamic> _$CategoryDataToJson(CategoryData instance) =>
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
