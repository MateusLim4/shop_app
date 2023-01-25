import 'package:flutter/material.dart';
import 'package:shop_app/data/dummy_data.dart';
import 'package:shop_app/models/product.dart';

class ProductList with ChangeNotifier {
  final List<Product> _items = dummyProducts;

  List<Product> get items => [..._items]; //Clone da lista

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners(); // Notifica todos widgets interessados após adicionar um widget
  }
}
