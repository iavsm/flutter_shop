import 'package:flutter/material.dart';
import 'package:flutter_shop/provider/Cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> cartItem;
  final DateTime dateTime;

  OrderItem(
      {@required this.id,
      @required this.amount,
      @required this.cartItem,
      @required this.dateTime});
}

class Order with ChangeNotifier {
  List<OrderItem> _order = [];

  List<OrderItem> get order {
    return _order;
  }

  void addOrder(List<CartItem> cartItems, double total) {
    _order.insert(
        0,
        OrderItem(
            id: DateTime.now().toString(),
            amount: total,
            cartItem: cartItems,
            dateTime: DateTime.now()));
    notifyListeners();
  }
}
