import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:test_case_smena/core/models/basket.dart';
import 'package:test_case_smena/core/repos/shared_storage.dart';

@LazySingleton()
class BasketRepository {
  final SharedStorage storage;
  final String _basketName = "basket";

  BasketRepository({required this.storage});

  Future<bool> isBasketSaved() async {
    if (await storage.contains(_basketName)){
      final basket = await restoreBasket();
      if (basket.items.isEmpty) {
        return Future.value(false);
      }
      return Future.value(true);
    }
    return Future.value(false);
  }

  Future<Basket> restoreBasket() async {
    var body = await storage.get(_basketName);
    var json = jsonDecode(body);
    return Basket.fromJson(json);
  }

  Future<void> saveBasket(Basket basket) async {
    await storage.set(_basketName, basket.toJson());
  }
}
