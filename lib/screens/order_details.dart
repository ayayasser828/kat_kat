import 'package:clippy_flutter/arc.dart';
import 'package:flutter/material.dart';
import 'package:kat_kat/constant/constant.dart';
import 'package:kat_kat/models/cart.dart';
import 'package:kat_kat/models/orders.dart';
import 'package:kat_kat/widgets/cart_item.dart';
import 'package:kat_kat/widgets/cart_item_card.dart';


class OrderDetailsScreen extends StatelessWidget {
  final Order order2;

  OrderDetailsScreen({this.order2});

  static const String routeName = "/OrderDetailsScreen";
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
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
                      'تفاصيل الطلب',
                      style: texty1,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Container(
                width: width,
                height: height-(height*0.38+30),
                child: ListView.builder(
                    itemCount: ((order2.cart.length)+1),
                    scrollDirection: Axis.vertical,
                    itemBuilder: ((context,index){
                      if(index == 0){
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10,left: 10,right: 10),
                          child: Container(
                            width: width*0.9,
                            height: 146,
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
                              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(order2.name,style: textA4 ),


                                      Row(
                                        children: [
                                          Text(" رقم الطلب: ",style: texty2),
                                          Text("${order2.id}",style: textA4),

                                        ],
                                      ),

                                      Row(
                                        children: [
                                          Text("تاريخ الطلب: ",style: texty2),
                                          Text("${order2.date}",style: textA4),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("حالة الطلب: ",style: texty2),
                                          Text("${order2.state}",style: order2.state=="مؤكدة"?TextStyle(fontSize: 14,color: colory3):order2.state=="ملغي"?TextStyle(fontSize: 14,color: colory4):TextStyle(fontSize: 14,color: colory5)),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("تاريخ الطلب: ",style: texty2),
                                          Text("${order2.date}",style: textA4),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("اجمالي المبلغ: ",style: texty2),
                                          Text("${order2.price}",style: textA4),
                                          Text("ريال",style: textA4),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],

                              ),
                            ),
                          ),
                        );
                      }
                      else{
                        return CartItem(cart: order2.cart[index-1],);
                      }

                    })),
              )
            ],
          ),
        ),
      ),
    );
  }
}
