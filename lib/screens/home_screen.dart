import 'package:coffee_shop_app/constants.dart';
import 'package:coffee_shop_app/data/cart.dart';
import 'package:coffee_shop_app/data/dummy_data.dart';
import 'package:coffee_shop_app/models/product_model.dart';
import 'package:coffee_shop_app/screens/cart_display.dart';
import 'package:coffee_shop_app/widgets/display_products.dart';
import 'package:flutter/material.dart';

import 'home/components/search_form.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed:(){} ,
          icon: const Icon(Icons.menu_sharp,color: Colors.grey,size: 30,),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.location_on_sharp, color: Colors.grey,),
            const SizedBox(width: defaultPadding/2,),
            Text(
                "Goregaon(west), Mumbai",
              style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.grey,),
            ),

          ],
        ),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.push(context,
                MaterialPageRoute(builder: (context)=>DisplayCartProducts(products: cart)),
                );
              },
              icon: const Icon(Icons.card_travel,color: Colors.grey,)
          )
        ],
      ),
      body:
         SafeArea(
           child: Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

              Text("Explore",
                    style: Theme.of(context).textTheme.headlineMedium?.
                    copyWith(fontWeight: FontWeight.w500,color: Colors.black),
                ),
                SizedBox(height: 30,),

                const Text("best Coffee Products for you",
                style: TextStyle(fontSize: 18),
                ),

                const Padding(
                  padding: EdgeInsets.symmetric(vertical: defaultPadding),
                  child: Search_Form(),
                ),
                SizedBox(height: 20,),


             Expanded(
               child: DisplayProducts(products: dummyData),
             ),


              ],
            ),
        ),
         ),

    );
  }
}

