import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/product_model.dart';

class ApiService {
  static const String baseUrl =
      'https://fakestoreapi.com/products';

  static Future<List<ProductModel>> getProducts() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);

      return data
          .map((e) => ProductModel.fromJson(e))
          .toList();
    } else {
      throw Exception('Gagal mengambil data');
    }
  }

  static Future<ProductModel> getDetail(int id) async {
    final response =
        await http.get(Uri.parse('$baseUrl/$id'));

    if (response.statusCode == 200) {
      return ProductModel.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw Exception('Gagal mengambil detail');
    }
  }
}