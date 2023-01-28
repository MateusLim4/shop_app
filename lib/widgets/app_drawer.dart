import 'package:flutter/material.dart';
import 'package:shop_app/routes/routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            automaticallyImplyLeading: false,
            title: const Text("Bem vindo Usuário!"),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.shop),
            title: const Text("Loja"),
            onTap: () =>
                Navigator.of(context).pushReplacementNamed(AppRoutes.home),
          ),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text("Pedidos"),
            onTap: () =>
                Navigator.of(context).pushReplacementNamed(AppRoutes.orders),
          ),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text("Gerenciar produtos"),
            onTap: () =>
                Navigator.of(context).pushReplacementNamed(AppRoutes.products),
          )
        ],
      ),
    );
  }
}
