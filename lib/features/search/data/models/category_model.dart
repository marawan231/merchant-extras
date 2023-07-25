import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CategoryModel {
  int? id;
  String? name;
  @JsonKey(name: 'image_url')
  String? imageUrl;

  CategoryModel({this.id, this.name, this.imageUrl});

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);

  
}
