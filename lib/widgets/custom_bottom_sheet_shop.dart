import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kat_kat/constant/constant.dart';
import 'package:kat_kat/models/cart_product.dart';
import 'package:kat_kat/providers/cart_item_card_provider.dart';
import 'package:provider/provider.dart';

import 'custom_bottom_sheet_payment.dart';
import 'cart_item_card.dart';

class CustomBottomSheetShop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var item = Provider.of<CartProducts>(context).item;
    return Container(
      width: width,
      height: height*0.9,
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Positioned(
            top: 60,
            child: Container(
              height: height,
              width: width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      textDirection: TextDirection.rtl,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap:(){
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: width*0.1,
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Image.asset("assets/images/no.png",width: 24,height: 24,),
                          ),
                        ),
                        Center(
                          child: Container(
                            alignment: Alignment.center,
                            width: width*0.8,
                              child: Text('السلة', style: text1.copyWith(fontWeight: FontWeight.bold))),
                        ),
                      ],
                    ),
                    Container(
                      height: height*0.55,
                      child: ListView.builder(
                        itemCount: item.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: ((context,index){
                          return CartItemCard(cartProduct: item[index],);
                        })
                      ),
                    ),
                    Divider(
                      height: 5,
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(41))
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: width,
              height: height*0.2,
              child: Column(
                children: [
                  Container(
                    height: height*0.19,
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.bottomCenter,
                          height: height*0.09,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '400 SR',
                                style: text1.copyWith(fontWeight: FontWeight.bold),
                                textDirection: TextDirection.ltr,
                              ),
                              Text(
                                'الإجمالي',
                                style: text1.copyWith(color: colorA8),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: height*0.1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text('ادفع',style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                                    FaIcon(FontAwesomeIcons.apple,size: 18,),
                                  ],
                                ),
                                width: 56,
                                height: 36,
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    border: Border.all(color: Colors.black,width: 2),
                                    borderRadius: BorderRadius.all(Radius.circular(5))
                                ),
                              ),
                              SizedBox(
                                /// Button
                                width: width * 0.68,
                                height: 44,
                                child: RaisedButton(
                                  color: colorm6,
                                  child: Text(
                                    'الدفع',
                                    style: text1.copyWith(color: Colors.white),
                                  ),
                                  onPressed: () {
                                    showModalBottomSheet(
                                        isScrollControlled: true,
                                        context: context,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(41.0),
                                          ),
                                        ),
                                        builder: (BuildContext context) =>
                                            CustomBottomSheetPayment(),backgroundColor: Colors.transparent);
                                  },
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(13))),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
