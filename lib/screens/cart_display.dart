import 'package:coffee_shop_app/data/cart.dart';
import 'package:coffee_shop_app/widgets/card.dart';
import 'package:flutter/material.dart';

import '../models/product_model.dart';

class DisplayCartProducts extends StatelessWidget {
  final List<Product> products;
  const DisplayCartProducts({Key? key,required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context,index){
            return ProductCard(product: cart[index]);
          }
      ),


    );
  }
}
