import 'package:json_annotation/json_annotation.dart';

part 'products_model.g.dart';

@JsonSerializable()
class ProductsModel {
  int? pageSize;
  int? pageIndex;
  int? count;
  List<ProductData>? data;

  ProductsModel({this.pageSize, this.pageIndex, this.count, this.data});

  factory ProductsModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsModelToJson(this);
}

@JsonSerializable()
class ProductData {
  String? productId;
  String? name;
  String? pictureUrl;
  String? size;
  int? stockQuantity;
  double? price;
  String? categoryId;
  String? categoryName;
  int? rate;

  ProductData({
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

  factory ProductData.fromJson(Map<String, dynamic> json) =>
      _$ProductDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDataToJson(this);
}
