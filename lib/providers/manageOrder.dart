import 'package:flutter/material.dart';
import './orders.dart';

class ManageOrder{
    final String id;
    final String imageUrl;
    final  String title;
    ManageOrder(this.id,this.imageUrl,this.title);
}
class ManagingOrder with ChangeNotifier{
  List<ManageOrder>_manage=[];
  List<ManageOrder> get manageProduct{
    return [..._manage];
  }

 
}