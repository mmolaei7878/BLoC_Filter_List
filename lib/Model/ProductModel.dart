import 'package:json_annotation/json_annotation.dart';

part 'ProductModel.g.dart';



@JsonSerializable()
class ProductModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  ProductModel({
    this.category,
    this.description,
    this.id,
    this.image,
    this.price,
    this.title,
  });
  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
