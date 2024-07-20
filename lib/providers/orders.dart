import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './cart.dart';

class OrderItem{
  final String id;
  final double amount;
  final List<CartItem>products;
  final DateTime  dateTime;
  OrderItem(
    this.id,
    this.amount,
    this.products,
    this.dateTime);
}

class Orders with ChangeNotifier{
List<OrderItem>_orders=[];

List<OrderItem> get orders{
  return [..._orders];
}
 
void addOrder(List<CartItem> cartProduct, double total){
    _orders.insert(
    0, 
    OrderItem(DateTime.now().toString(),
    total, 
    cartProduct, 
    DateTime.now()));
    notifyListeners();
}
void ClearOrder(){
  _orders.clear();
  notifyListeners();
  }
  void update(){
   // _orders.replaceRange(start, end, replacements)
  }
}