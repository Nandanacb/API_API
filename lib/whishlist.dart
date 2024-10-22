import 'package:flutter/material.dart';
class Wishlist extends StatefulWidget{
 @override
 State<Wishlist> createState()=> _Wishlist();
}
class _Wishlist extends State<Wishlist>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Wishlist"),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart)),
        ],
      ),
      body: Column(
        children: [
           
        ],
      ),
    );
  }
}