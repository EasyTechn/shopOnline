import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_state_management/screens/cartScreen.dart';
import 'package:shop_state_management/widgets/app_drawer.dart';
import '../providers/cart.dart';
import '../widgets/product_grid.dart';
import '../widgets/badge.dart';
enum FilterOption{
  favorite,
  all
}
class ProductOverViewScreen extends StatefulWidget{
  @override
  static const routeName='productOverview';
  State<ProductOverViewScreen> createState() => _ProductOverViewScreenState();
}

class _ProductOverViewScreenState extends State<ProductOverViewScreen> {
  bool _showfavoriteOnly=false;
  @override 
  Widget build(BuildContext context){
   // final cart =Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOption selectedValue) {
              setState(() {
                if(selectedValue==FilterOption.favorite){
              _showfavoriteOnly=true;
              }else{
               _showfavoriteOnly=false;
              }
              });
            },
            icon: const Icon(Icons.more_vert),
            itemBuilder: ((context) => [
              const PopupMenuItem(
                child: Text('only Favorites'),value: FilterOption.favorite,
                ),
                 const PopupMenuItem(
               child: Text('show all'),value: FilterOption.all,
                )
                
            ])),
            
            Consumer<Cart>(
              builder: ((context, cart, child) =>Badge(
               value: cart.itemCount.toString(), 
                color: Colors.red,
               child: IconButton(
                icon: const Icon(Icons.shopping_cart), 
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                  },
                )) ),
            )
        ],
      ), 
      drawer: AppDrawer(),
      body: ProductGrid(_showfavoriteOnly),
    );
  }
}
