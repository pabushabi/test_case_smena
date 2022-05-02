import 'package:injectable/injectable.dart';
import 'package:test_case_smena/core/models/product.dart';

@LazySingleton()
class Basket{
  late List<Product> items;
  late int itemsCount;
  late int totalPrice;

  Basket() {
    items = [];
    itemsCount = items.length;
    totalPrice = 0;
  }

  addItem(Product product) {
    items.add(product);
    itemsCount = items.length;
    totalPrice += product.cost;
  }

  removeItem(Product product) {
    if (items.isNotEmpty) {
      items.remove(product);
      itemsCount = items.length;
      totalPrice -= product.cost;
    }
  }

  removeAll() {
    items.clear();
    totalPrice = 0;
  }
}