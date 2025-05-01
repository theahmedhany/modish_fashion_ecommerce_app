import 'package:json_annotation/json_annotation.dart';

part 'all_categories_model.g.dart';

@JsonSerializable()
class AllCategoriesModel {
  String? id;
  String? name;
  String? description;

  AllCategoriesModel({this.id, this.name, this.description});

  factory AllCategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$AllCategoriesModelFromJson(json);

  Map<String, dynamic> toJson() => _$AllCategoriesModelToJson(this);
}
