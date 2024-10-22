import 'package:flutter/material.dart';
class Cartpage extends StatefulWidget{
  @override
  State<Cartpage> createState()=> _CartPageState();
}
class _CartPageState extends State<Cartpage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("CART PAGE"),
      centerTitle: true,),
      
    );
  }
}