import 'package:flutter/material.dart';
import 'package:test_case_smena/core/models/category.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key, required this.category}) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(category.categoryName),
      ),
    );
  }
}
