import 'package:flutter/material.dart';
import 'package:flutter_shop/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {

  final String id;
  final String title;
  final String imageUrl;

  ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(ProductDetailScreen.routeName);
        },
        child: GridTile(
            footer: GridTileBar(
              backgroundColor: Colors.black,
              title: Text(title,
              textAlign: TextAlign.center,),
              leading: Icon(Icons.favorite, color: Theme.of(context).accentColor,),
              trailing: Icon(Icons.shop, color: Theme.of(context).accentColor,),

            ),
            child: Container(
              child: Image.network(imageUrl,fit: BoxFit.cover),
            )),
      ),
    );
  }
}
