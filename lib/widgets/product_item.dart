import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';
import '../screens/product_deails_screen.dart';
import '../providers/product.dart';
class product_item extends StatelessWidget{

  @override 
  Widget build(BuildContext context){
     final product= Provider.of<Product>(context,listen: false);
     final cart =Provider.of<Cart>(context,listen: false);
    return ClipRRect(
      borderRadius:BorderRadius.circular(10.0),
      child: GridTile(
        footer: GridTileBar(
            leading: Consumer<Product>(
              builder: (context, product, child) =>IconButton(icon: Icon(product.isFavorite?Icons.favorite:Icons.favorite_border),
             color: Theme.of(context).colorScheme.secondary,
            onPressed: (() {
              product.toggleFavouriteStatus();
            }),
            ), 
            ),
            trailing: IconButton(icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              cart.addItem(product.id, product.price, product.title);
            }, 
            color: Theme.of(context).colorScheme.secondary,
            ),
            backgroundColor: Colors.black54,
            title: Text(product.title,
            textAlign: 
            TextAlign.center,
            )),
        child: GestureDetector(
          onTap: (() {
            Navigator.of(context).pushNamed(ProductDetail.routeName,arguments: product.id);
          }),
          child: Hero(
            tag: product.id,
            child: FadeInImage(
              placeholder:const AssetImage('assets/images/placeholder_image.png'),
              image:NetworkImage(product.imageUrl),
              fit: BoxFit.cover
                  ),
          ),
          ),
      )
    ); 
  }
}