import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_state_management/providers/cart.dart';
import 'package:shop_state_management/providers/manageOrder.dart';
import 'package:shop_state_management/providers/orders.dart';
import 'package:shop_state_management/screens/cartScreen.dart';
import 'package:shop_state_management/screens/orderScreen.dart';
import 'package:shop_state_management/screens/productScreenOverview.dart';
import 'package:shop_state_management/screens/product_deails_screen.dart';
import './providers/product_provider.dart';
import 'dart:async';


void main()=>runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider(
     create: (context) => Products(),
        ),
         ChangeNotifierProvider(
     create: (context) => Cart(),
        ),
            ChangeNotifierProvider(
     create: (context) => Orders(),
            ),
           ChangeNotifierProvider(
     create: (context) => ManagingOrder (),
        ),
      ],
     child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Shop',
        theme: ThemeData(
          primarySwatch: Colors.green,
          accentColor: Color.fromARGB(255, 243, 153, 19)
        ),
        home: SplashScreen(),
        routes: {
          ProductDetail.routeName:(context) =>ProductDetail(),
          CartScreen.routeName:(context)=>CartScreen(),
          OrdersScreen.routeName:(context) => OrdersScreen(),
          ProductOverViewScreen.routeName:(context) => ProductOverViewScreen()
        },
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds:2),
    ()=>Navigator.pushReplacement(context,
     MaterialPageRoute(builder:
     (context)=>ProductOverViewScreen()
     )
     )
    );
  }
  @override 
  Widget build(BuildContext context) {
    return Container(
       color:Colors.green,
     // child:FlutterLogo(size:MediaQuery.of(context).size.height)
     child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
       children: const [
         Icon(Icons.shop,size: 70,color:Colors.white),
        // Text('hello'),
          Text(' MyShop',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black54,),),
       ],
     )
    );
  }
}




