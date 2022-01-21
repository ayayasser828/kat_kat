import 'package:clippy_flutter/arc.dart';
import 'package:flutter/material.dart';
import 'package:kat_kat/constant/constant.dart';
import 'package:kat_kat/models/orders.dart';
import 'package:kat_kat/screens/order_details.dart';
import 'package:kat_kat/widgets/cart_item_card.dart';


class OrderCard extends StatelessWidget {
  final Order order;

  static const String routeName = "/OrderCard";

  const OrderCard({Key key, this.order}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10,left: 10,right: 10),
        child: InkWell(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder:(contex)=> OrderDetailsScreen(order2: order,)));
          },
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
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(order.name,style: textA4 ),


                      Row(
                        children: [
                          Text(" رقم الطلب: ",style: texty2),
                          Text("${order.id}",style: textA4),

                        ],
                      ),

                      Row(
                        children: [
                          Text("تاريخ الطلب: ",style: texty2),
                          Text("${order.date}",style: textA4),
                           ],
                      ),
                      Row(
                        children: [
                          Text("حالة الطلب: ",style: texty2),
                          Text("${order.state}",style: order.state=="مؤكدة"?TextStyle(fontSize: 14,color: colory3):order.state=="ملغي"?TextStyle(fontSize: 14,color: colory4):TextStyle(fontSize: 14,color: colory5)),
                        ],
                      ),
                      Row(
                        children: [
                          Text("تاريخ الطلب: ",style: texty2),
                          Text("${order.date}",style: textA4),
                        ],
                      ),
                      Row(
                        children: [
                          Text("اجمالي المبلغ: ",style: texty2),
                          Text("${order.price}",style: textA4),
                          Text("ريال",style: textA4),
                        ],
                      ),


                    ],
                  ),
                  Icon(Icons.arrow_forward_ios , )
                ],

              ),
            ),
          ),
        ),
      ),
    );
  }
}