import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kat_kat/constant/constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kat_kat/widgets/bottom_nav_bar.dart';

import 'code_screen.dart';
import 'main_screen.dart';


class PhoneScreen extends StatelessWidget {
  static const String routeName = '/PhoneScreen';

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var orientationPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Container(
            width: width,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 40,),
                  Image.asset("assets/images/splash_img.png",width:215.39,height:181 ,),
                  SizedBox(height: 20,),
                  Text("تسجيل الدخول",style: textm12,),
                  SizedBox(height: 40,),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text("رقم الجوال",style: textm13,),
                    ),
                  ),
                  Container(
                    width: width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          width:width*0.2,
                          height: 45,
                          child: Material(
                            borderRadius: BorderRadius.all(Radius.circular(23)),
                            elevation: 2,
                            shadowColor: Colors.white,
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(23)),
                                  borderSide: BorderSide.none,
                                ),
                                hintText: '+966',
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                          width:width*0.55,
                          height: 45,
                          child: Material(
                            borderRadius: BorderRadius.all(Radius.circular(23)),
                            elevation: 2,
                            shadowColor: Colors.white,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(23)),
                                  borderSide: BorderSide.none,
                                ),
                                hintText: '55xxxxxxx',

                              ),
                            ),
                          ),
                        )

                      ],
                    ),
                  ),
                  SizedBox(height: 50,),
                  SizedBox(
                    width: width,
                    height: 44,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed( CodeScreen.routeName);
                      },
                      color: colorm6,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(23))),
                      child: Container(
                        width: width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "دخول",
                              style: textm14,
                            ),
                            SizedBox(width: 90,),
                            Align(
                                alignment: Alignment.centerRight,
                                child: Image.asset("assets/images/next.png",width:33,height:34.15 ,)),
                          ],
                        ),
                      ),
                    ),
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
