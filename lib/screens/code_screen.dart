import 'package:flutter/material.dart';
import 'package:kat_kat/constant/constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kat_kat/widgets/bottom_nav_bar.dart';

import 'main_screen.dart';


class CodeScreen extends StatelessWidget {
  static const String routeName = '/CodeScreen';

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
                      child: Text("الرجاء إدخال رمز التحقق",style: textm13,),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    width:width,
                    height: 45,
                    padding: EdgeInsets.symmetric(horizontal: 3),
                    child: Material(
                      borderRadius: BorderRadius.all(Radius.circular(23)),
                      elevation: 2,
                      shadowColor: Colors.grey,
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


                        ),
                      ),
                    ),
                  )
,
                  SizedBox(height: 60,),
                  SizedBox(
                    width: width,
                    height: 44,
                    child: RaisedButton(
                      onPressed: () {
                         Navigator.of(context).pushNamedAndRemoveUntil( MainScreen.routeName,(Route<dynamic> route) => false);
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
