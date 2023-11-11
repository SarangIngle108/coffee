import 'package:coffee_shop_app/data/cart.dart';
import 'package:flutter/material.dart';

import '../models/product_model.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key,required this.product}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey,
      margin: EdgeInsets.all(10),
      child: Container(
        child: Column(
          children: [
            Text(product.title,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            SizedBox(height: 5,),
            Text(product.description),
            SizedBox(height: 5,),
            Image.asset(product.link,fit: BoxFit.cover,height: 120,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(product.price.toString(),style: TextStyle(fontSize: 20),),
                SizedBox(width: 10,),
                ElevatedButton(onPressed: (){
                 cart.add(product);

                }, child: Icon(Icons.add)),

              ],
            )
          ],
        ),
      ),
    );
  }
}
