import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/cart/cart.dart';
import 'package:shop_app/routes/routes.dart';
import '../models/product/product.dart';
import '../theme/app_theme.dart';

class ProductGridItem extends StatelessWidget {
  const ProductGridItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: Consumer<Product>(
          builder: (context, product, _) => GridTileBar(
            title: Text(product.title),
            leading: IconButton(
              onPressed: () {
                product.toggleFavorite(product);
              },
              icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border),
              color: AppTheme.colors.primary,
            ),
            trailing: IconButton(
              color: AppTheme.colors.primary,
              icon: const Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                cart.addItem(product);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  dismissDirection: DismissDirection.horizontal,
                  duration: const Duration(milliseconds: 2),
                  content: const Text(
                      "Produto adicionado! \nDeslise para remover a mensagem"),
                  action: SnackBarAction(
                    label: "Desfazer",
                    onPressed: () {
                      cart.removeSingleItem(product.id);
                    },
                  ),
                ));
              },
            ),
            backgroundColor: AppTheme.colors.cardBackgroud,
          ),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRoutes.productDetail,
              arguments: product,
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
