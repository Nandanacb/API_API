import 'package:flutter/material.dart';
import 'package:product_api/cartpage.dart';
import 'package:product_api/datamodel.dart';
class WhishlistDemo extends StatelessWidget {
  final Product product;
  WhishlistDemo({required this.product});
 


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Wishlist"),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart)),
        ],
      ),
      body: ListView.builder(
      itemCount: 1,
        scrollDirection: Axis.vertical,
        itemBuilder: (context,index){
        return ListTile(
          leading: Image.network(product.thumbnail,height: 60,width: 60,),
          title: Text(product.title,style: TextStyle(fontSize: 12),),
          subtitle: Text("\$${product.price.toString()}"),
          trailing: ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Cartpage()));
          }, child:Text("ADD TO CART") ),
        );
        })
    );
  }
}