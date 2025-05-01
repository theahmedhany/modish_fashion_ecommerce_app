import 'package:json_annotation/json_annotation.dart';

part 'search_products_model.g.dart';

@JsonSerializable()
class SearchProductsModel {
  int? pageSize;
  int? pageIndex;
  int? count;
  List<SearchProductsData>? data;

  SearchProductsModel({this.pageSize, this.pageIndex, this.count, this.data});

  factory SearchProductsModel.fromJson(Map<String, dynamic> json) =>
      _$SearchProductsModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchProductsModelToJson(this);
}

@JsonSerializable()
class SearchProductsData {
  String? productId;
  String? name;
  String? pictureUrl;
  String? size;
  int? stockQuantity;
  double? price;
  String? categoryId;
  String? categoryName;
  int? rate;

  SearchProductsData({
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

  factory SearchProductsData.fromJson(Map<String, dynamic> json) =>
      _$SearchProductsDataFromJson(json);

  Map<String, dynamic> toJson() => _$SearchProductsDataToJson(this);
}
