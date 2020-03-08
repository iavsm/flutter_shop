import 'package:flutter/material.dart';
import 'package:flutter_shop/provider/order.dart' show Order;
import 'package:flutter_shop/widgets/order_item.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {

  static const routeName = '/order';

  @override
  Widget build(BuildContext context) {
    final order = Provider.of<Order>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Order"),
      ),
      body: ListView.builder(
          itemCount: order.order.length,
          itemBuilder: (context, index) => OrderItem(order.order[index])),
    );
  }
}
