import 'package:flutter/material.dart';
import 'package:shop_state_management/screens/orderScreen.dart';
import 'package:shop_state_management/screens/productScreenOverview.dart';
import 'package:shop_state_management/screens/product_deails_screen.dart';
import '../screens/cartScreen.dart ';

class AppDrawer extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return Drawer(
      child: Column(
        children: [
          AppBar(title: Text("hello friends!"),
          automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Shop'),
            onTap: (() =>  Navigator.of(context).pushReplacementNamed(ProductOverViewScreen.routeName)
            )
            ),
             Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Orders'),
            onTap: (() =>  Navigator.of(context).pushReplacementNamed(OrdersScreen.routeName)
            )
            )
        ],
      ),
    );
  }
}