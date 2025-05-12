import 'package:json_annotation/json_annotation.dart';

part 'product_details_model.g.dart';

@JsonSerializable()
class ProductDetailsModel {
  @JsonKey(name: 'productId')
  String? id;
  String? name;
  String? description;
  String? pictureUrl;
  List<String>? sizes;
  List<String>? colors;
  int? stockQuantity;
  double? price;
  List<Review>? reviews;
  String? categoryName;
  String? categoryId;
  bool? isInFav;
  bool? isInCart;
  int? quantityInBasket;

  ProductDetailsModel({
    this.id,
    this.name,
    this.description,
    this.pictureUrl,
    this.sizes,
    this.colors,
    this.stockQuantity,
    this.price,
    this.reviews,
    this.categoryName,
    this.categoryId,
    this.isInFav,
    this.isInCart,
    this.quantityInBasket,
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
