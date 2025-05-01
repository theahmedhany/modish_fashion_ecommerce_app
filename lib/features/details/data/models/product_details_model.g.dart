// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailsModel _$ProductDetailsModelFromJson(Map<String, dynamic> json) =>
    ProductDetailsModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      pictureUrl: json['pictureUrl'] as String?,
      size: json['size'] as String?,
      colors: json['colors'] as String?,
      stockQuantity: (json['stockQuantity'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toDouble(),
      reviews:
          (json['reviews'] as List<dynamic>?)
              ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
              .toList(),
      categoryName: json['categoryName'] as String?,
      categoryId: json['categoryId'] as String?,
    );

Map<String, dynamic> _$ProductDetailsModelToJson(
  ProductDetailsModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'pictureUrl': instance.pictureUrl,
  'size': instance.size,
  'colors': instance.colors,
  'stockQuantity': instance.stockQuantity,
  'price': instance.price,
  'reviews': instance.reviews,
  'categoryName': instance.categoryName,
  'categoryId': instance.categoryId,
};

Review _$ReviewFromJson(Map<String, dynamic> json) => Review(
  comment: json['comment'] as String?,
  numberOfPoint: (json['numberOfPoint'] as num?)?.toInt(),
  createdAt:
      json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
  appUserId: json['appUserId'] as String?,
);

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
  'comment': instance.comment,
  'numberOfPoint': instance.numberOfPoint,
  'createdAt': instance.createdAt?.toIso8601String(),
  'appUserId': instance.appUserId,
};
