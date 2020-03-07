import 'package:flutter/material.dart';
import 'package:flutter_shop/provider/Product.dart';
import 'package:flutter_shop/provider/product_provider.dart';
import 'package:flutter_shop/widgets/product_item.dart';
import 'package:provider/provider.dart';

class ProductGrid extends StatelessWidget {

  bool showFavorite = false;

  ProductGrid(this.showFavorite);

  @override
  Widget build(BuildContext context) {

    final productData = Provider.of<ProductProvider>(context);
    final List<Product> loadesProducts = showFavorite ? productData.getFavoriteProduct : productData.getProduct;

    return GridView.builder(
      padding: EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
          //builder: (c) => loadesProducts[index],
          value: loadesProducts[index],
          child: ProductItem(),
        ),
      itemCount: loadesProducts.length,
    );
  }
}
