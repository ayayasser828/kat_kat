import 'package:clippy_flutter/arc.dart';
import 'package:flutter/material.dart';
import 'package:kat_kat/constant/constant.dart';
import 'package:kat_kat/models/cart.dart';
import 'package:kat_kat/models/orders.dart';
import 'package:kat_kat/widgets/cart_item_card.dart';
import 'package:kat_kat/widgets/order_card.dart';


class ProductOrderScreen extends StatelessWidget {
  final List<Order> order=[
    Order(
      date: "12/10/2020",
      id: 1,
      name:'بلايستيشن 10',
      price: 800,
      state: 'مؤكدة',
      cart: [
        Cart(
          price: 40,
          image: 'assets/images/nf.png',
          budget: 10,
          marcket: 'السعودى',
          name: 'بطاقة بلايستيشن سعودى'
        ),
        Cart(
            price: 40,
            image: 'assets/images/nf.png',
            budget: 10,
            marcket: 'السعودى',
            name: 'بطاقة بلايستيشن سعودى'
        ),
        Cart(
            price: 40,
            image: 'assets/images/nf.png',
            budget: 10,
            marcket: 'السعودى',
            name: 'بطاقة بلايستيشن سعودى'
        )
      ]
    ),
    Order(
        date: "12/10/2020",
        id: 1,
        name:'بلايستيشن 10',
        price: 800,
        state: 'ملغي',
        cart: [
          Cart(
              price: 40,
              image: 'assets/images/nf.png',
              budget: 10,
              marcket: 'السعودى',
              name: 'بطاقة بلايستيشن سعودى'
          ),
          Cart(
              price: 40,
              image: 'assets/images/nf.png',
              budget: 10,
              marcket: 'السعودى',
              name: 'بطاقة بلايستيشن سعودى'
          ),
          Cart(
              price: 40,
              image: 'assets/images/nf.png',
              budget: 10,
              marcket: 'السعودى',
              name: 'بطاقة بلايستيشن سعودى'
          )
        ]
    ),
    Order(
        date: "12/10/2020",
        id: 1,
        name:'بلايستيشن 10',
        price: 800,
        state: 'تحت المعالجة',
        cart: [
          Cart(
              price: 40,
              image: 'assets/images/nf.png',
              budget: 10,
              marcket: 'السعودى',
              name: 'بطاقة بلايستيشن سعودى'
          ),
          Cart(
              price: 40,
              image: 'assets/images/nf.png',
              budget: 10,
              marcket: 'السعودى',
              name: 'بطاقة بلايستيشن سعودى'
          ),
          Cart(
              price: 40,
              image: 'assets/images/nf.png',
              budget: 10,
              marcket: 'السعودى',
              name: 'بطاقة بلايستيشن سعودى'
          )
        ]
    )
  ];
  static const String routeName = "/ProductOrderScreen";
  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        child: Column(
          children: [
            Container(
              width: width,
              height: height*0.38,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Arc(
                    edge: Edge.BOTTOM,
                    arcType: ArcType.CONVEX,
                    height: 30.0,
                    child: Container(
                      width: width,
                      height: height * 0.38,
                      decoration: BoxDecoration(
                        color: colory1
                      ),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    right: 20,
                    child: Column(
                      children: <Widget>[
                        InkWell(
                          onTap:(){
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Icon(Icons.close),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'طلباتي',
                        style: texty1,
                  ),
                ],
              ),
            ),
        Container(
          width: width,
          height: height*0.62,

          child: ListView.builder(
              itemCount: order.length,
              scrollDirection: Axis.vertical,
              itemBuilder: ((context,index){
                return OrderCard(order: order[index],);
              })),
        )
          ],
        ),
      ),
    );
  }
}
