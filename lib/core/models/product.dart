import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable(createToJson: false)
class Product extends Equatable {
  final int id;
  final String name;
  @JsonKey(name: "image_url")
  final String imageUrl;
  final int cost;
  final String sizes;
  final int categoryId;
  int count;

  Product(
    this.id,
    this.name,
    this.imageUrl,
    this.cost,
    this.sizes,
    this.categoryId, {
    this.count = 1,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => <String, dynamic>{
        '"id"': id,
        '"name"': '"$name"',
        '"image_url"': '"$imageUrl"',
        '"cost"': cost,
        '"sizes"': '"$sizes"',
        '"categoryId"': categoryId,
        '"count"': count,
      };

  @override
  List<Object?> get props => [id, name, imageUrl, cost, sizes, categoryId];
}
