import 'dart:async';

import 'package:flutter/material.dart';

import 'account_login_screen.dart';



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed( AccountLoginScreen.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        child: Center(
          child: Image.asset("assets/images/splash_img2.png",width: width,height:height*0.7 ,),
        ),
      ),
    );
  }
}
