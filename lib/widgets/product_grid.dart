import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_state_management/widgets/product_item.dart';
import '../providers/product_provider.dart';

class ProductGrid extends StatelessWidget{
  final bool showfavorit;
  ProductGrid(this.showfavorit);

  @override 
  Widget build(BuildContext context){
    final ProductData= Provider.of<Products>(context);
    final Productz=showfavorit? ProductData.getfavoriteItem: ProductData.ProductList;
    return GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: Productz.length,
        itemBuilder: (context, index) => ChangeNotifierProvider.value(
         value: Productz[index],
          //builder: (context, child) => Products[index],
          child: product_item(),
        ),

        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 2/2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10),
      );
  }
}