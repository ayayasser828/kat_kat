import 'package:clippy_flutter/arc.dart';
import 'package:flutter/material.dart';
import 'package:kat_kat/constant/constant.dart';
import 'package:kat_kat/models/cart.dart';
import 'package:kat_kat/models/orders.dart';
import 'package:kat_kat/screens/order_details.dart';
import 'package:kat_kat/widgets/cart_item_card.dart';


class CartItem extends StatelessWidget {
  final Cart cart;

  static const String routeName = "/CartItem";

  const CartItem({Key key, this.cart}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10,left: 10,right: 10),
        child: Container(
          width: width*0.9,

          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ]
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                    child: Image.asset(cart.image,height: 47,width: 81, fit:BoxFit.fill ,)),
                SizedBox(width: 10,),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(cart.name,style: texty2 ),
                    Row(
                      children: [
                        Text("المتجر : ",style: texty2),
                        Text("${cart.marcket}",style: texty2),
                      ],
                    ),
                    Row(
                      children: [
                        Text("رصيد البطاقة : ",style: texty2),
                        Text("${cart.budget}",style: texty2),
                        Text("دولار",style: texty2),
                      ],
                    ),
                    Row(
                      children: [
                        Text(" السعر الاجمالي : ",style: texty2),
                        Text("${cart.price}",style: texty2),
                        Text("ريال",style: texty2),
                      ],
                    ),



                  ],
                ),

              ],

            ),
          ),
        ),
      ),
    );
  }
}