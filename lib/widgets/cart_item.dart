import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/cart/cart.dart';
import 'package:shop_app/models/cart/cart_item.dart';
import 'package:shop_app/theme/app_theme.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;
  const CartItemWidget({Key? key, required this.cartItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(cartItem.id),
      direction: DismissDirection.startToEnd,
      onDismissed: (_) {
        Provider.of<Cart>(
          context,
          listen: false,
        ).removeItem(cartItem.productId);
      },
      background: Container(
        height: 15,
        color: AppTheme.colors.error,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 20),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 30,
        ),
      ),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: CircleAvatar(
                child: Padding(
              padding: const EdgeInsets.all(5),
              child: FittedBox(child: Text("${cartItem.price}")),
            )),
            title: Text(cartItem.title),
            subtitle: Text("Total: R\$ ${cartItem.price * cartItem.quantity}"),
            trailing: Text("${cartItem.quantity}x"),
          ),
        ),
      ),
    );
  }
}
