import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:product_api/datamodel.dart';
import 'package:product_api/details.dart';

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
              : GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
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
                        height: 400,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color.fromARGB(255, 70, 8, 3))),
                        child: Column(
                          children: [
                            Image.network(product.thumbnail,
                                width: 100, height: 100),
                            SizedBox(
                              height: 10,
                            ),
                            Text(product.title),
                            SizedBox(
                              height: 10,
                            ),
                            Text("\$${product.price.toString()}"),
                          ],
                        ),
                      ),
                    );
                  }),
    );
  }
}
