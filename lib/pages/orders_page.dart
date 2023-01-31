import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/order/order_list.dart';
import 'package:shop_app/widgets/app_drawer.dart';
import 'package:shop_app/widgets/order_widget.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OrderList orders = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meus pedidos"),
      ),
      drawer: const AppDrawer(),
      body: FutureBuilder(
        future: Provider.of<OrderList>(context, listen: false).loadOrders(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.error != null) {
            return const Center(
              child: Text("Ocorreu um Erro ao buscar os pedidos!"),
            );
          } else {
            return Consumer<OrderList>(
                builder: (ctx, value, child) => ListView.builder(
                      itemCount: orders.itemsCount,
                      itemBuilder: (ctx, index) => OrderWidget(
                        order: orders.items[index],
                      ),
                    ));
          }
        },
      ),
    );
  }
}
