import 'package:json_annotation/json_annotation.dart';
import 'package:test_case_smena/core/models/category.dart';

part 'menu.g.dart';

@JsonSerializable()
class Menu {
  final List<Category> menu;

  Menu(this.menu);

  factory Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);

  Map<String, dynamic> toJson() => _$MenuToJson(this);
}