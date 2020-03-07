import 'package:flutter/material.dart';
import 'package:flutter_shop/provider/product_provider.dart';
import 'package:flutter_shop/widgets/product_grid.dart';
import 'package:provider/provider.dart';

enum FilterOptions {
  ShowFavorite,
  ShowAll,
}

class ProductOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {

  bool _showFavorite = false;

  @override
  Widget build(BuildContext context) {

    final product = Provider.of<ProductProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Shop"),
        actions: <Widget>[
          PopupMenuButton(
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  if(selectedValue == FilterOptions.ShowFavorite) {
                    _showFavorite = true;
                  } else {
                    _showFavorite = false;
                  }
                });
              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (_) => [
                    PopupMenuItem(
                        child: Text("Show favorite"),
                        value: FilterOptions.ShowFavorite),
                    PopupMenuItem(
                        child: Text("Show All"), value: FilterOptions.ShowAll),
                  ]),
        ],
      ),
      body: Container(
        child: ProductGrid(_showFavorite),
      ),
    );
  }
}
