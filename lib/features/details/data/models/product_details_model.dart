import 'package:json_annotation/json_annotation.dart';

part 'product_details_model.g.dart';

@JsonSerializable()
class ProductDetailsModel {
  String? id;
  String? name;
  String? description;
  String? pictureUrl;
  String? size;
  String? colors;
  int? stockQuantity;
  double? price;
  List<Review>? reviews;
  String? categoryName;
  String? categoryId;

  ProductDetailsModel({
    this.id,
    this.name,
    this.description,
    this.pictureUrl,
    this.size,
    this.colors,
    this.stockQuantity,
    this.price,
    this.reviews,
    this.categoryName,
    this.categoryId,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailsModelToJson(this);
}

@JsonSerializable()
class Review {
  String? comment;
  int? numberOfPoint;
  DateTime? createdAt;
  String? appUserId;

  Review({this.comment, this.numberOfPoint, this.createdAt, this.appUserId});

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}
