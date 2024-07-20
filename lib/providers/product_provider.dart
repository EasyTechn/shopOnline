import 'package:flutter/material.dart';
import 'package:shop_state_management/providers/product.dart'; 

class Products with ChangeNotifier{
    final List<Product> _items=[
         Product(
    id: 'P1',
    title: 'white-tshirt',
    description:'The red T-shirt ever happen in the world',
    price: 10.0,
    imageUrl:'https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1553120277-theory-1553120269.jpg' 
   ),
    Product(
    id: 'P2',
    title: 'pink-tshirt',
    description:'The hotPink T-shirt ever happen in century',
    price: 10.0,
    imageUrl:'https://th.bing.com/th/id/OIP.ClLPUsRoae0B5Yvo4Fr6RwHaHb?pid=ImgDet&rs=1' 
   ),
   Product(
    id: 'P3',
    title: 'white-tshirt',
    description:'The red T-shirt ever happen in the world',
    price: 10.0,
    imageUrl:'https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1553120277-theory-1553120269.jpg' 
   ),
    Product(
    id: 'P4',
    title: 'pink-tshirt',
    description:'The hotPink T-shirt ever happen in century',
    price: 10.0,
    imageUrl:'https://th.bing.com/th/id/OIP.ClLPUsRoae0B5Yvo4Fr6RwHaHb?pid=ImgDet&rs=1' 
   ),
  Product(
    id: 'P5',
    title: 'Grey-Trouser',
    description:'The red T-shirt ever happen in the world',
    price: 10.0,
    imageUrl:'https://static.zara.net/photos///2023/V/0/1/p/2825/026/688/2/w/563/2825026688_6_1_1.jpg?ts=1681725472337',
   ),
    ];

    // var _showfavoriteOnly=false;
    List<Product> get ProductList{
  //  if(_showfavoriteOnly){
  //   return _items.where((prodItem) => prodItem.isFavorite).toList();
  //  }
      return [..._items];
    }

    List<Product> get getfavoriteItem{
      return _items.where((prodItem) => prodItem.isFavorite).toList();
    }

    void addProduct(){
      notifyListeners();
    }
    Product findById (String id){
    return _items.firstWhere((element) => element.id==id);
    }

    // void showfavoriteOnly(){
    //   _showfavoriteOnly=true;
    //   notifyListeners();
    // }
    // void showAll(){
    //   _showfavoriteOnly=false;
    //   notifyListeners();
    // }
}