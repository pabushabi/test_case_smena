import 'dart:convert';
import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';

import '../models/menu.dart';

@LazySingleton()
class MenuRepository {
  final _dio = Dio();
  final _apiUrl =
      "https://gist.githubusercontent.com/pabushabi/d0ae94f936156055b0d22a40c9979e0b/raw/1e11b17b3dac9ffb056afa4240db94f5cc3bac4a/menu.json";

  Future<Menu> getMenu() async {
    final response = await _dio.get(_apiUrl);
    final list = Menu.fromJson(jsonDecode(response.data));
    return list;
  }
}
