import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:product_api/datamodel.dart';
import 'package:product_api/details.dart';
import 'package:product_api/whishlist.dart';

class Api extends StatefulWidget {
  const Api({super.key});
  @override
  State<Api> createState() => _ApiState();
}

class _ApiState extends State<Api> {
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    _getData();
  }

  ProductmodelApi? dataFromAPI;
  _getData() async {
    try {
      String url = "https://dummyjson.com/products";
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        dataFromAPI = ProductmodelApi.fromJson(json.decode(res.body));
        _isLoading = false;
        setState(() {});
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product API Examples"),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : dataFromAPI == null
              ? const Center(
                  child: Text('Failed to load data'),
                )
              : Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5),
                    itemCount: dataFromAPI!.products.length,
                    itemBuilder: (context, index) {
                      final product = dataFromAPI!.products[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ApiDemo(
                                        product: product,
                                      )));
                        },
                        child: Container(
                          height: 600,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color.fromARGB(255, 70, 8, 3))),
                          child: Center(
                            child: Column(
                              children: [
                                Image.network(product.thumbnail,
                                    width: double.infinity, height: 82),
                                
                                Text(product.title),
                                
                                Text("\$${product.price.toString()}"),
                                                                  
                                Row(
                                  children: [
                                    SizedBox(width: 120,),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>WhishlistDemo(product: product,)));
                                      },
                                      child: Icon(Icons.favorite_border_outlined))
                                   
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
    );
  }
}
