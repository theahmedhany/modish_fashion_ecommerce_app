// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_products_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchProductsModel _$SearchProductsModelFromJson(Map<String, dynamic> json) =>
    SearchProductsModel(
      pageSize: (json['pageSize'] as num?)?.toInt(),
      pageIndex: (json['pageIndex'] as num?)?.toInt(),
      count: (json['count'] as num?)?.toInt(),
      data:
          (json['data'] as List<dynamic>?)
              ?.map(
                (e) => SearchProductsData.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
    );

Map<String, dynamic> _$SearchProductsModelToJson(
  SearchProductsModel instance,
) => <String, dynamic>{
  'pageSize': instance.pageSize,
  'pageIndex': instance.pageIndex,
  'count': instance.count,
  'data': instance.data,
};

SearchProductsData _$SearchProductsDataFromJson(Map<String, dynamic> json) =>
    SearchProductsData(
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

Map<String, dynamic> _$SearchProductsDataToJson(SearchProductsData instance) =>
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
