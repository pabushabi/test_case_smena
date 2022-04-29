import 'dart:convert';
import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:test_case_smena/core/models/category.dart';
import 'package:dio/dio.dart';

import '../models/menu.dart';

@LazySingleton()
class MenuRepository {
  final _dio = Dio();
  // final _apiUrl = "https://gist.githubusercontent.com/Pelmeshka102/7237ce5d931e3066084231ab56332419/raw/9a91e435370cdf52e5bcdd92b05043e9a19b991d/test.json";
  final _apiUrl = "https://gist.githubusercontent.com/pabushabi/d0ae94f936156055b0d22a40c9979e0b/raw/1e11b17b3dac9ffb056afa4240db94f5cc3bac4a/menu.json";

  Future<Menu> getMenu() async {
    final response = await _dio.get(_apiUrl);
    final list = Menu.fromJson(jsonDecode(response.data));
    // final list = jsonDecode(response.data);
    // log("${list.menu[0].categoryName}", name: "response");
    return list;
  }
}