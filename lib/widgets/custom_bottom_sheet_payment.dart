import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kat_kat/constant/constant.dart';
import 'package:kat_kat/models/payment_card.dart';
import 'package:kat_kat/widgets/pay_card.dart';
import 'package:kat_kat/widgets/payment_data.dart';

class CustomBottomSheetPayment extends StatelessWidget {

  final List<PaymentCard> cards = [
    PaymentCard(
        img: 'assets/images/visa.png',
        title: 'VISA Pay',
        cardNum: '**********1512'
    ),
    PaymentCard(
        img: 'assets/images/master.png',
        title: 'MasterCard',
        cardNum: '**********1512'
    ),
    PaymentCard(
        img: 'assets/images/visa.png',
        title: 'VISA Pay',
        cardNum: '**********1512'
    ),
    PaymentCard(
        img: 'assets/images/master.png',
        title: 'MasterCard',
        cardNum: '**********1512'
    ),
  ];


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery
        .of(context)
        .size
        .width;
    var height = MediaQuery
        .of(context)
        .size
        .height;
    return Container(
      width: width,
      height: height * 0.9,
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Positioned(
            top: 60,
            child: Container(
              height: height * 0.9,
              width: width,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40, right: 30),
                      child: Text('طريقة الدفع',
                          style: text1.copyWith(color: colorA8)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(context: context,
                            isScrollControlled: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(41.0),),
                            ),
                            builder: (BuildContext context) => PaymentData(),backgroundColor: Colors.transparent);
                      },
                      child: Container(
                        width: width,
                        height: height * 0.45,
                        child: ListView.builder(
                          itemCount: cards.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: ((context, index) {
                            return PayCard(
                                cards[index].img, cards[index].title,
                                cards[index].cardNum);
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(41))),
            ),
          ),
          Positioned(
            bottom: 0.0,
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.only(top: 5),
              height: height*0.21,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: height*0.018,),
                  SizedBox(
                    /// Button
                    width: width*0.95,
                    height: height*0.065,
                    child: RaisedButton(
                      padding: EdgeInsets.all(0.0),
                      // color: Theme.of(context).accentColor,
                      child: Container(
                        alignment: Alignment.center,
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.all(Radius.circular(10)),
                          gradient: linearGradientA2,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'أضف بطاقة دفع',
                              style: text1.copyWith(color: Colors.white),
                            ),
                            Icon(
                              Icons.add,
                              size: 15,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      onPressed: () {
                      },
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(13))),
                    ),
                  ), /// 0.08
                  // Divider(
                  //   height: 5,
                  // ),
                  Container(  ///0.15
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    width: width,
                    // height: height*0.15,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height:height*0.05,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '800 SR',
                                    style: text1.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Text(
                                      'الإجمالي: ',
                                      style: text1.copyWith(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    '2',
                                    style: text1.copyWith(color: colorA8),
                                  ),
                                  Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Text(
                                      'الكمية: ',
                                      style: text1.copyWith(color: colorA8),
                                    ),
                                  ),

                                ],
                              ),
                            ],
                          ),
                        ),
                        // SizedBox(height: 15,),
                        Container(
                          // height: height*0.08,
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
                                height: height*0.055,
                                child: RaisedButton(
                                  color: colorm6,
                                  child: Text(
                                    'الدفع',
                                    style: text1.copyWith(color: Colors.white),
                                  ),
                                  onPressed: () {

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
          Positioned(
            top: 60,
            right: 25,
            child: Column(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Image.asset(
                      "assets/images/no.png",
                      width: 26,
                      height: 26,
                    ),
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
