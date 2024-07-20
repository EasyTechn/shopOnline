import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product_provider.dart';


class ProductDetail extends StatelessWidget{
  // final String title;
  // ProductDetailsOverViewScreen(this.title);
  static const routeName='/product-details';

  const ProductDetail({super.key});
  @override 
  Widget build(BuildContext context){
    final productID = ModalRoute.of(context)!.settings.arguments as String;
    final loadedProduct=Provider.of<Products>(context,listen: false).findById(productID);
   return Scaffold(
     // appBar: AppBar(title:  Text(loadedProduct.title)),
      body:  CustomScrollView(
        slivers: [
         SliverAppBar(
          expandedHeight: 300,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(loadedProduct.title),
            background:Hero(
              tag: loadedProduct.id,
              child: Image.network(loadedProduct.imageUrl,fit: BoxFit.cover)), 
          ),
         ),
         SliverList(
          delegate: SliverChildListDelegate([
           const SizedBox(height: 10,), 
           Text('price:\$${loadedProduct.price.toString()}',style: const TextStyle(
            color: Colors.grey,
            fontSize: 20),
            textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10,), 
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(loadedProduct.description,
              style:  TextStyle(),
              textAlign: TextAlign.center,
              softWrap: true,),
            ) ,
            SizedBox(height: 800,)
          ])
          )
        ],
      ),
    );
  }
}