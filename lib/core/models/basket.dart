import 'package:injectable/injectable.dart';
import 'package:test_case_smena/core/models/product.dart';

@LazySingleton()
class Basket {
  late List<Product> items;
  late int itemsCount;
  late int totalPrice;

  Basket() {
    items = [];
    itemsCount = items.length;
    totalPrice = 0;
  }

  addItem(Product product) {
    if (items.contains(product)) {
      items[items.indexOf(product)].count++;
      totalPrice += product.cost;
    } else {
      items.add(product);
      totalPrice += product.cost;
    }
    itemsCount = 0;
    for (var item in items) {
      itemsCount += item.count;
    }
  }

  removeItem(Product product) {
    if (items.isNotEmpty) {
      if (items[items.indexOf(product)].count > 1) {
        items[items.indexOf(product)].count--;
        totalPrice -= product.cost;
      } else {
        items.remove(product);
        totalPrice -= product.cost;
      }
      itemsCount = 0;
      for (var item in items) {
        itemsCount += item.count;
      }
    }
  }

  removeAll() {
    items.clear();
    totalPrice = 0;
  }
}
