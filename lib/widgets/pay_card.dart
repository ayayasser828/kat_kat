import 'package:flutter/material.dart';
import 'package:kat_kat/constant/constant.dart';
import 'package:kat_kat/models/payment_card.dart';

class PayCard extends StatelessWidget {
  final String img;
  final String title;
  final String cardNum;
  PayCard(this.img,this.title,this.cardNum);


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding:  EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: width,
            height: height*0.2,
            child: Stack(
              children: [
                Container(
                  width: width,
                    child: Image.asset(img,fit: BoxFit.fill,)),
                Positioned(
                  bottom: 30.0,
                  right: 20.0,
                  child: Column(
                    children: [
                      Text(title,style: textA18,),
                      Text(cardNum,style: textA18,),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
