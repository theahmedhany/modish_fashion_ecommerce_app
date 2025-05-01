import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  int? pageSize;
  int? pageIndex;
  int? count;
  List<CategoryData>? data;

  CategoryModel({this.pageSize, this.pageIndex, this.count, this.data});

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}

@JsonSerializable()
class CategoryData {
  String? productId;
  String? name;
  String? pictureUrl;
  String? size;
  int? stockQuantity;
  double? price;
  String? categoryId;
  String? categoryName;
  int? rate;

  CategoryData({
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

  factory CategoryData.fromJson(Map<String, dynamic> json) =>
      _$CategoryDataFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryDataToJson(this);
}
