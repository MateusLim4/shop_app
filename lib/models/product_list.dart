import 'package:flutter/material.dart';
import 'package:shop_app/data/dummy_data.dart';
import 'package:shop_app/models/product.dart';

class ProductList with ChangeNotifier {
  final List<Product> _items = dummyProducts;
  final List<Product> _favoriteItems =
      dummyProducts.where((product) => product.isFavorite).toList();

  List<Product> get items => [..._items];
  List<Product> get favoriteItems => [..._favoriteItems];

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners(); // Notifica todos widgets interessados após adicionar um widget
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