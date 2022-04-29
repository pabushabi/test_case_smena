import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  final int id;
  final String name;
  @JsonKey(name: "image_url")
  final String imageUrl;
  final int cost;
  final String sizes;
  final int categoryId;

  Product(
    this.id,
    this.name,
    this.imageUrl,
    this.cost,
    this.sizes,
    this.categoryId,
  );

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}