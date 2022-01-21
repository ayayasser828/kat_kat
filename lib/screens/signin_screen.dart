import 'package:flutter/material.dart';
import 'package:kat_kat/constant/constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'main_screen.dart';

class SignInScreen extends StatelessWidget {
  static const String routeName = '/SignInScreen';

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var orientationPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: orientationPortrait
                ? EdgeInsets.symmetric(horizontal: 30.0)
                : EdgeInsets.symmetric(horizontal: 80.0),
            child: Column(
              children: [
                SizedBox(height: height * 0.15),
                Center(
                  child: Image.asset(
                    'assets/images/splash_img.png',
                    width: 289,
                    height: 243,
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Form(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      children: [
                        Container(
                          width: width * 0.8,
                          height: 45,
                          child: Material(
                            borderRadius: BorderRadius.all(Radius.circular(23)),
                            elevation: 2,
                            shadowColor: Colors.white,
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(23)),
                                  borderSide: BorderSide.none,
                                ),
                                hintText: 'example@takwen.com',
                                prefixIcon: Icon(Icons.person),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: width * 0.8,
                          height: 45,
                          child: Material(
                            borderRadius: BorderRadius.all(Radius.circular(23)),
                            elevation: 2,
                            shadowColor: Colors.white,
                            child: TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(23)),
                                  borderSide: BorderSide.none,
                                ),
                                hintText: '•••••••••••',
                                prefixIcon: Icon(Icons.lock_open),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        SizedBox(
                          width: width,
                          height: 44,
                          child: RaisedButton(
                            color: colorm8,
                            child: Text(
                              'تسجيل دخول',
                              style: text1.copyWith(color: Colors.white),
                            ),
                            onPressed: () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  MainScreen.routeName,
                                  (Route<dynamic> route) => false);
                            },
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(23))),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                SingleChildScrollView(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: width*0.16,
                        height: 35,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Colors.black,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: FaIcon(
                            FontAwesomeIcons.apple,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: width*0.16,
                        height: 35,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Colors.white,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Image.asset('assets/images/ic_google.png'),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: width*0.16,
                        height: 35,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Color(0xFF507CC0),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: FaIcon(
                            FontAwesomeIcons.facebookF,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: width*0.16,
                        height: 35,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Color(0xFF64CCF1),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: FaIcon(
                            FontAwesomeIcons.twitter,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
