import 'dart:convert';
import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:test_case_smena/core/models/basket.dart';
import 'package:test_case_smena/core/models/product.dart';
import 'package:test_case_smena/core/repos/shared_storage.dart';

@LazySingleton()
class BasketRepository {
  final SharedStorage storage;
  final String _basketName = "basket";

  BasketRepository({required this.storage});

  Future<bool> isBasketSaved() async {
    return storage.contains(_basketName);
  }

  Future<Basket> restoreBasket() async {
    var body = await storage.get(_basketName);
    body = body.replaceAll('{', '{"'); // Очень плохо. Не стоит делать так, но я
    body = body.replaceAll(': ', '": "'); // не смог разобраться, как заставить
    body = body.replaceAll('": "[', '": ['); // JsonSerializable ставить кавычки.
    body = body.replaceAll(', ', '", "'); // Поэтому использую вот это :(
    body = body.replaceAll('}', '"}');
    body = body.replaceAll('"}",', '"},');
    body = body.replaceAll('"{"', '{"');
    body = body.replaceAll('"}]"', '"}]');
    final newString = body.replaceAllMapped(RegExp(r'"\d{1,}"'), (match) {
      return match.group(0).toString().replaceAll('"', '');
    });
    var json = jsonDecode(newString);
    log(json.runtimeType.toString(), name: "json");
    return Basket.fromJson(json);
  }

  Future<void> saveBasket(Basket basket) async {
    log("${basket.toJson().runtimeType}", name: "saving item");
    await storage.set(_basketName, basket.toJson());
    log("${await storage.get(_basketName)}", name: "Saved");
  }
}
