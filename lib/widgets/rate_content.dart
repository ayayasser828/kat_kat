import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kat_kat/constant/constant.dart';

class RateContent extends StatefulWidget {
  @override
  _RateContentState createState() => _RateContentState();
}

class _RateContentState extends State<RateContent> {



  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        Text('خالد على',style: textA17,),
                        SizedBox(height: 5,),
                        Container(
                          width: 45,
                          height: 25,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: colorA16,
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FaIcon(FontAwesomeIcons.solidStar,size: 14,color: colorA17,),
                              Text('4.5',style: textA18,),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 10,),
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage('https://i.redd.it/6onq25y0sh311.jpg'),
                      backgroundColor: Colors.transparent,
                    ),
                  ],
                ),
                Text('متجر مميز في سهولة الاستخدام وسرعة استلام الكود وسهولة الدفع عندهم',style: textA19,textDirection: TextDirection.rtl,),
                Divider(height: 30,thickness: 1,),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          children: [
                            Text('خالد على',style: textA17,),
                            SizedBox(height: 5,),
                            Container(
                              width: 45,
                              height: 25,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: colorA16,
                                borderRadius: BorderRadius.all(Radius.circular(14)),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FaIcon(FontAwesomeIcons.solidStar,size: 14,color: colorA17,),
                                  Text('4.5',style: textA18,),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 10,),
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage('https://i.redd.it/6onq25y0sh311.jpg'),
                          backgroundColor: Colors.transparent,
                        ),
                      ],
                    ),
                    Text('متجر مميز في سهولة الاستخدام وسرعة استلام الكود وسهولة الدفع عندهم',style: textA19,textDirection: TextDirection.rtl,),
                    Divider(height: 30,thickness: 1,),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          children: [
                            Text('خالد على',style: textA17,),
                            SizedBox(height: 5,),
                            Container(
                              width: 45,
                              height: 25,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: colorA16,
                                borderRadius: BorderRadius.all(Radius.circular(14)),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FaIcon(FontAwesomeIcons.solidStar,size: 14,color: colorA17,),
                                  Text('4.5',style: textA18,),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 10,),
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage('https://i.redd.it/6onq25y0sh311.jpg'),
                          backgroundColor: Colors.transparent,
                        ),
                      ],
                    ),
                    Text('متجر مميز في سهولة الاستخدام وسرعة استلام الكود وسهولة الدفع عندهم',style: textA19,textDirection: TextDirection.rtl,),
                    Divider(height: 30,thickness: 2,),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
