import 'package:flutter/material.dart';
import 'package:flutter_shop/provider/Cart.dart';
import 'package:flutter_shop/provider/Product.dart';
import 'package:flutter_shop/screens/product_detail_screen.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  ProductItem();

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            builder: (ctx, product, _) => IconButton(
              icon: Icon(
                product.isFavotite ? Icons.favorite : Icons.favorite_border,
              ),
              color: Theme.of(context).accentColor,
              onPressed: () {
                product.toggleFavoriteStatus();
              },
            ),
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {
              cart.addCartItem(
                  productId: product.id,
                  title: product.title,
                  price: product.price);
              Scaffold.of(context).hideCurrentSnackBar();
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text("Added item to cart."),
                duration: Duration(seconds: 2),
                action: SnackBarAction(
                  onPressed: (){
                    cart.removeSingleItem(product.id);
                  },
                  label: "UNDO",
                ),
              ));
            },
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}

/**
 *
 * return Consumer<Product>(
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
 */
