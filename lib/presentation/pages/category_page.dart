import 'package:flutter/material.dart';
import 'package:test_case_smena/core/models/category.dart';
import 'package:test_case_smena/presentation/widgets/product_widget.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key, required this.category}) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          category.categoryName,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 76,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 2 / 2.4,
        padding: const EdgeInsets.all(16),
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        physics: const BouncingScrollPhysics(),
        children: List.generate(
          category.products.length,
          (index) => ProductWidget(
            product: category.products[index],
            onTap: () {},
          ),
        ),
      ),
    );
  }
}
