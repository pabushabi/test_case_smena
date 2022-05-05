import 'package:json_annotation/json_annotation.dart';
import 'package:test_case_smena/core/models/product.dart';

part 'category.g.dart';

@JsonSerializable()
class Category {
  final int id;
  @JsonKey(name: "image_url")
  final String imageUrl;
  @JsonKey(name: "category_name")
  final String categoryName;
  final List<Product> products;

  Category(
    this.id,
    this.imageUrl,
    this.categoryName,
    this.products,
  );

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
