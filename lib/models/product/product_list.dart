import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop_app/data/dummy_data.dart';
import 'package:shop_app/models/product/product.dart';

class ProductList with ChangeNotifier {
  final List<Product> _items = dummyProducts;

  List<Product> get items => [..._items];

  List<Product> get favoriteItems =>
      _items.where((product) => product.isFavorite).toList();

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners(); // Notifica todos widgets interessados após adicionar um widget
  }

  int get countItens {
    return _items.length;
  }

  void addProductFromData(Map<String, dynamic> data) {
    final newProduct = Product(
      id: Random().nextDouble().toString(),
      title: data['name'],
      description: data['description'],
      price: data['price'],
      imageUrl: data['imageUrl'],
    );
    addProduct(newProduct);
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