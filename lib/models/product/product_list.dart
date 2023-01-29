import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/data/dummy_data.dart';
import 'package:shop_app/models/product/product.dart';

class ProductList with ChangeNotifier {
  final _baseUrl = "URL";
  final List<Product> _items = dummyProducts;

  List<Product> get items => [..._items];

  List<Product> get favoriteItems =>
      _items.where((product) => product.isFavorite).toList();

  Future<void> addProductFromData(Map<String, dynamic> data) {
    bool hasId = data['id'] != null;

    final product = Product(
      id: hasId ? data['id'] as String : Random().nextDouble().toString(),
      title: data['name'] as String,
      description: data['description'] as String,
      price: data['price'] as double,
      imageUrl: data['imageUrl'] as String,
    );

    if (hasId) {
      return updateProduct(product);
    } else {
      return addProduct(product);
    }
  }

  Future<void> addProduct(Product product) async {
    final response = await http.post(Uri.parse("$_baseUrl/products.json"),
        body: jsonEncode(
          {
            "name": product.title,
            "price": product.price,
            "description": product.description,
            "imageUrl": product.imageUrl,
            "isFavorite": product.isFavorite,
          },
        ));
    final id = jsonDecode(response.body)["name"];
    _items.add(
      Product(
          id: id,
          title: product.title,
          description: product.description,
          price: product.price,
          imageUrl: product.imageUrl,
          isFavorite: product.isFavorite),
    );
    notifyListeners();
  }

  Future<void> updateProduct(Product product) {
    int index = _items.indexWhere((p) => p.id == product.id);
    if (index >= 0) {
      _items[index] = product;
      notifyListeners();
    }

    return Future.value();
  }

  int get countItens {
    return _items.length;
  }

  void removeProduct(Product product) {
    int index = _items.indexWhere((p) => p.id == product.id);
    _items.removeWhere(
      (p) => p == _items[index],
    );
    notifyListeners();
  }
}

/*
bool _showFavoritesOnly = false;

  List<Product> get items {
    if (_showFavoritesOnly) {
      return _items.where((product) => product.isFavorite).toList();
    }
    return [..._items]; //Clone da lista
  }

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners(); // Notifica todos widgets interessados após adicionar um widget
  }

  void showFavoritesOnly() {
    _showFavoritesOnly = true;
    notifyListeners();
  }

  void showAll() {
    _showFavoritesOnly = false;
    notifyListeners();
  }*/