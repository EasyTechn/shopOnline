
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/orders.dart';
import '../providers/cart.dart' show Cart;
import '../widgets/cart_Item.dart';


class CartScreen extends StatelessWidget{
  static const routeName='cart';
  @override 
  Widget build(BuildContext context){
    final cart=Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your cart',)
        ),
        body: Column(
          children: [
            Card(
              margin: EdgeInsets.all(15),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Total',style: TextStyle(fontSize: 20),),
                    Spacer(),
                    Chip(label: Text(cart.totalAmount.toString(),style: const TextStyle(color: Colors.white),),
                    backgroundColor: Colors.green,
                    ),
                    TextButton(
                    child: const Text('ORDER NOW'),
                    onPressed: () {
                      Provider.of<Orders>(context, listen: false).addOrder(cart.items.values.toList(), cart.totalAmount);
                     cart.clear();
                    },
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
         Expanded(
  child: ListView.builder(
    itemCount: cart.items.length,
    itemBuilder: (context, index) => CartItem(
      cart.items.values.toList()[index].id,
      cart.items.keys.toList()[index],
      cart.items.values.toList()[index].price,
       cart.items.values.toList()[index].quantity, 
       cart.items.values.toList()[index].title
       ),
    // itemBuilder: (BuildContext context, int index) {
    //   return CartItem(
    //     id: cart.items[index].id,
    //     price: cart.items[index].price,
    //     quantity: cart.items[index].quantity,
    //     title: cart.items[index].title,
    //   );
    // },
  ),
)

  ]
    ),
   );      
  }
}