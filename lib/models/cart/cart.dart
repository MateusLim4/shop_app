import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shop_app/models/cart/cart_item.dart';
import '../product/product.dart';

class Cart with ChangeNotifier {
  Map<String, CartItem> _item = {};

  Map<String, CartItem> get items {
    return {..._item};
  }

  void addItem(Product product) {
    if (_item.containsKey(product.id)) {
      _item.update(
        product.id,
        (existingItem) => CartItem(
          id: existingItem.id,
          title: existingItem.title,
          productId: existingItem.productId,
          price: existingItem.price,
          quantity: existingItem.quantity + 1,
        ),
      );
    } else {
      _item.putIfAbsent(
        product.id,
        () => CartItem(
          id: Random().nextDouble().toString(),
          title: product.title,
          productId: product.id,
          price: product.price,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _item.remove(productId);
    notifyListeners();
  }

  void clear() {
    _item = {};
    notifyListeners();
  }

  int get itemsCount {
    return _item.length;
  }

  double get totalAmount {
    double total = 0;
    _item.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }
}
