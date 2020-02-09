import 'package:flutter/material.dart';
import 'package:flutter_shop/Model/Product.dart';
import 'package:flutter_shop/widgets/product_grid.dart';
import 'package:flutter_shop/widgets/product_item.dart';
import 'package:provider/provider.dart';

class ProductOverviewScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Shop"),
      ),
      body: Container(
        child: ProductGrid(),
      ),
    );
  }
}
