import 'package:flutter/material.dart';
import 'package:flutter_shop/provider/Product.dart';
import 'package:flutter_shop/screens/product_detail_screen.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
//  final String id;
//  final String title;
//  final String imageUrl;
//
//  ProductItem(this.id, this.title, this.imageUrl);
    ProductItem();

  @override
  Widget build(BuildContext context) {
    //final product = Provider.of<Product>(context);
    return Consumer<Product>(
      builder: (context, product, child) =>  ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pushNamed(ProductDetailScreen.routeName, arguments: product.id);
            },
            child: GridTile(
                footer: GridTileBar(
                  backgroundColor: Colors.black,
                  title: Text(
                    product.title,
                    textAlign: TextAlign.center,
                  ),
                  leading: IconButton(
                    icon: Icon( ((product.isFavotite) ? Icons.favorite : Icons.favorite_border),),
                    color: Theme.of(context).accentColor,
                    onPressed: () {
                      product.toggleFavoriteStatus();
                    },

                  ),
                  trailing: Icon(
                    Icons.shop,
                    color: Theme.of(context).accentColor,
                  ),
                ),
                child: Container(
                  child: Image.network(product.imageUrl, fit: BoxFit.cover),
                )),
          ),
        ),

    );
  }
}
