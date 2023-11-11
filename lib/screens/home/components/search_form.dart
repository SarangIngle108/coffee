import 'package:coffee_shop_app/widgets/display_products.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../data/dummy_data.dart';
import '../../../models/product_model.dart';



class Search_Form extends StatefulWidget {
  const Search_Form({
    super.key,
  });

  @override
  State<Search_Form> createState() => _Search_FormState();
}

class _Search_FormState extends State<Search_Form> {
final searchController = TextEditingController();

List<Product> filteredProducts = [];

void filterProducts(String query){
  setState(() {
    filteredProducts = dummyData.where((product) =>
        product.title.toLowerCase().contains(query.toLowerCase())).toList();
  });
  DisplayProducts( products: filteredProducts,);
}

  @override

  void initState() {
    filteredProducts = dummyData;
    super.initState();
  }
  Widget build(BuildContext context) {
    return Form(
        child: TextFormField(
          onChanged: filterProducts,
          controller: searchController,

          decoration: const InputDecoration(
            hintText: "Search items...",
            filled: true,
            fillColor: Colors.white,
            border: outLineBorder,
            enabledBorder: outLineBorder,
            focusedBorder: outLineBorder,
            prefixIcon: Padding(
              padding: EdgeInsets.all(12.0),
              child: Icon(Icons.search,),
            ),
            suffixIcon: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: defaultPadding/2,
              ),
              child: SizedBox(
                height: 48,
                width: 48,
                child: ElevatedButton(
                  onPressed: null,
                  child: Icon(Icons.filter_alt),

                ),
              ),
            ),
          ),

        )
    );
  }
}

const  OutlineInputBorder outLineBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius)),
  borderSide: BorderSide.none,
);
