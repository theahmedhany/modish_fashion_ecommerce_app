import 'package:json_annotation/json_annotation.dart';

part 'favorite_model.g.dart';

@JsonSerializable()
class FavoriteModel {
  int? pageSize;
  int? pageIndex;
  int? count;
  List<FavoriteProductData>? data;

  FavoriteModel({this.pageSize, this.pageIndex, this.count, this.data});

  factory FavoriteModel.fromJson(Map<String, dynamic> json) =>
      _$FavoriteModelFromJson(json);

  Map<String, dynamic> toJson() => _$FavoriteModelToJson(this);
}

@JsonSerializable()
class FavoriteProductData {
  String? productId;
  String? name;
  String? pictureUrl;
  String? size;
  int? stockQuantity;
  double? price;
  String? categoryId;
  String? categoryName;
  int? rate;

  FavoriteProductData({
    this.productId,
    this.name,
    this.pictureUrl,
    this.size,
    this.stockQuantity,
    this.price,
    this.categoryId,
    this.categoryName,
    this.rate,
  });

  factory FavoriteProductData.fromJson(Map<String, dynamic> json) =>
      _$FavoriteProductDataFromJson(json);

  Map<String, dynamic> toJson() => _$FavoriteProductDataToJson(this);
}
