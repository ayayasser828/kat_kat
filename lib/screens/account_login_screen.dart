import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kat_kat/constant/constant.dart';
import 'package:kat_kat/screens/phone_screen.dart';
import 'package:kat_kat/screens/signin_screen.dart';
import 'package:kat_kat/screens/signup_screen.dart';

import 'main_screen.dart';

class AccountLoginScreen extends StatelessWidget {
  static const String routeName = "/AccountLoginScreen";
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var orientationPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: orientationPortrait
                  ? EdgeInsets.symmetric(horizontal: 30)
                  : EdgeInsets.symmetric(horizontal: 80),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: height * 0.65,
                    width: width,
                    child: Image.asset("assets/images/splash_img2.png",fit: BoxFit.cover,),
                  ),
                  SizedBox(height: height * 0.01,),
                  Container(
                    width: width,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: width,
                            height: height * 0.065,
                            child: RaisedButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed( SignInScreen.routeName);
                              },
                              color: colorm6,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(23))),
                              child: Center(
                                child: Text(
                                  "تسجيل دخول",
                                  style: textm1,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height:  height * 0.01,
                          ),
                          SizedBox(
                            width: width,
                            height:  height * 0.065,
                            child: RaisedButton(
                              onPressed: () {
                                 Navigator.of(context).pushNamed( PhoneScreen.routeName);
                              },
                              color: colorm7,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(23))),
                              child: Center(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Text(
                                    "تسجيل دخول بأستخدام الجوال",
                                    style: textm1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height:  height * 0.01,
                          ),
                          SizedBox(
                            width: width,
                            height:  height * 0.065,
                            child: RaisedButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed( SignUpScreen.routeName);
                              },
                              color: colorm8,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(23))),
                              child: Center(
                                child: Text(
                                  "انشاء حساب",
                                  style: textm1,
                                ),
                              ),
                            ),
                          ),                        ],
                      ),
                    ),
                  ),
                  SizedBox(height:  height * 0.02,),
                  Align(
                    alignment: Alignment.bottomLeft,
                      child: InkWell(
                        onTap: (){
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              MainScreen.routeName,
                                  (Route<dynamic> route) => false);
                        },
                          child: Text("تخطي",style: textm17,))),
                  SizedBox(height:  height * 0.01,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
