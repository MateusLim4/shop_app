import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/constants/constants.dart';

import '../../exceptions/http_exception.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.imageUrl,
      this.isFavorite = false});

  void toggleFavorite(Product product) async {
    isFavorite = !isFavorite;
    notifyListeners();
    const baseUrl = Constants.baseUrl;

    final response = await http.patch(
      Uri.parse("$baseUrl/${product.id}.json"),
      body: jsonEncode(
        {
          "isFavorite": isFavorite,
        },
      ),
    );

    if (response.statusCode >= 400) {
      isFavorite = !isFavorite;
      notifyListeners();
      MyHttpException(
          msg: "Não foi possível excluir o produto",
          statusCode: response.statusCode);
    }
  }
}
