import 'package:freezed_annotation/freezed_annotation.dart';

part 'products_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductsModel {
  int? id;
  String? name;
  @JsonKey(name: 'image_url')
  String? imageUrl;

  ProductsModel({this.id, this.name, this.imageUrl});

  factory ProductsModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsModelToJson(this);

  
}
