import 'package:flutter/material.dart';
import 'package:flutter_shop/Model/Product.dart';
import 'package:flutter_shop/provider/product_provider.dart';
import 'package:flutter_shop/widgets/product_item.dart';
import 'package:provider/provider.dart';

class ProductGrid extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final productData = Provider.of<ProductProvider>(context);
    List<Product> loadesProducts = productData.getProduct;

    return GridView.builder(
      padding: EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return ProductItem(loadesProducts[index].id,
            loadesProducts[index].title, loadesProducts[index].imageUrl);
      },
      itemCount: loadesProducts.length,
    );
  }
}
