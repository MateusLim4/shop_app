import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/theme/app_theme.dart';
import 'package:shop_app/widgets/cart_item.dart';

import '../models/cart/cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of(context);
    final items = cart.items.values.toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Carrinho",
        ),
      ),
      body: Column(children: [
        Card(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total",
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(width: 10),
                  Chip(
                    backgroundColor: AppTheme.colors.primary,
                    label: Text(
                      "R\$${cart.totalAmount.roundToDouble()}",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        textStyle: TextStyle(color: AppTheme.colors.primary)),
                    child: const Text("COMPRAR"),
                  )
                ]),
          ),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) =>
                  CartItemWidget(cartItem: items[index])),
        )
      ]),
    );
  }
}