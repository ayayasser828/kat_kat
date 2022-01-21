import 'package:flutter/material.dart';
import 'package:kat_kat/constant/constant.dart';
import 'package:kat_kat/models/product-render.dart';

import 'package:kat_kat/screens/product_pge.dart';
import 'package:provider/provider.dart';




class CardOfProduct extends StatelessWidget {
  final Item product;

  CardOfProduct({this.product});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    // var product = Provider.of<Product>(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => ProductPge(idProduct: product.id,)));
        },
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              child: Column(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(product.images[0].url,width: width*0.4,height: height*0.21,fit: BoxFit.fill,)),
                  Align(
                    alignment: Alignment.centerLeft,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                          child: Text(product.name,style: textm3,))),
                  SizedBox(height: height*0.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){
                          // product.isFavoredSelected();
                        },
            // product.isFavored
                          child: Icon(true?Icons.favorite:Icons.favorite_border,color: Colors.red,)),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
