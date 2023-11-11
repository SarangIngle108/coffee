import 'package:coffee_shop_app/widgets/card.dart';
import 'package:flutter/material.dart';

import '../models/product_model.dart';

class DisplayProducts extends StatelessWidget {
  final List<Product> products;
  const DisplayProducts({Key? key,required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context,index){
            return ProductCard(product: products[index]);
          }
      ),
    );
  }
}
