import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/orders.dart' as ord;
import 'package:intl/intl.dart';

import '../providers/orders.dart';

class OrderItem extends StatefulWidget{
  final ord.OrderItem order;
  OrderItem(this.order);

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _expanded=false;
  @override
   Widget build(BuildContext context) {
    
  return AnimatedContainer(
    duration: const Duration(milliseconds: 300),
    height: _expanded ? min(widget.order.products.length * 20 + 110, 200): 95 ,
    child: Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
       ListTile(
        title: Text('\$${widget.order.amount}'),
        subtitle: Text(DateFormat('dd/MM/yyyy hh:mm').format(widget.order.dateTime),
        ),
        trailing: IconButton(
          icon: Icon(_expanded? Icons.expand_less: Icons.expand_more),
          onPressed: (() {
         setState(() {
            _expanded=!_expanded;
         });
        }),),
        ),
       AnimatedContainer(
    duration: const Duration(milliseconds: 300),
    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 4),
    height: _expanded ? min(widget.order.products.length * 20 + 10, 100): 0 ,
    child: ListView(
      children: widget.order.products.map((prod) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            prod.title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            '${prod.quantity}x \$${prod.price}',
            style: const TextStyle(fontSize: 18, color: Colors.grey),
          ),
        ],
      )).toList(), // Convert Iterable to List
    ),
    ),
        ]
        ),
        ),
  );
      
}
}