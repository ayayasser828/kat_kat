
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kat_kat/constant/constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kat_kat/models/user.dart';
import 'package:kat_kat/providers/auth.dart';
import 'package:kat_kat/providers/user_provider.dart';
import 'package:kat_kat/widgets/bottom_nav_bar.dart';
import 'package:provider/provider.dart';

import 'main_screen.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = '/SignUpScreen';

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var _isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey();
  String email;
  String firstname;
  String lastname ;
  String telephone;
  String password;
  String redirectUrl;


  /// password validation
  String validatePassword(String value) {
    Pattern pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~-]).{8,}$';
    RegExp regex = new RegExp(pattern);
    print(value);
      if (!regex.hasMatch(value)){
        return 'كلمة المرور غير صحيحة';
      } else if (value.isEmpty || value.length < 5){
        return "كلمة السر قصيرة جدا";
      }
        return null;
    }




  Future<void> _submit() async {
    String result;
    if(!_formKey.currentState.validate()){
      //invalid
      return;
    }else{
      _formKey.currentState.save();
      User _user = User(customer: Customer(addresses: [Address(telephone: telephone)],email: email,firstname: firstname,lastname: lastname),password: password,redirectUrl: "");
     await Provider.of<UserProvider>(context,listen: false).registerUser(_user).then((value) {
        setState(() {
          _isLoading = false;
          result = value;
        });
      });

    if (result == "success"){
      Navigator.of(context).pushNamedAndRemoveUntil(
          MainScreen.routeName,
              (Route<dynamic> route) => false);
    }
     else if (result == "Email already exists"){
      return showAlertDialog(context);
    }
    }

  }

  void showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Row(
        textDirection: TextDirection.rtl,
        children: [
          Icon(Icons.cancel,color: Colors.red,),
          SizedBox(width: 10,),
          Text('خطأ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.red),),

        ],
      ),
      content: Text('البريد الإلكتروني مسجل بالفعل',textDirection: TextDirection.rtl,),
    );
    showDialog(
      context: context,
      builder: (BuildContext context){
        return alert;
      },
    );
  }


  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();




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
                SizedBox(height: height * 0.05),
                Center(
                  child: Image.asset(
                    'assets/images/splash_img.png',
                    width: 227,
                    height: 191,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: width * 0.35,
                              height: height*0.1,
                              child: TextFormField(
                                validator: (input){
                                  if(input.isEmpty){
                                    return "من فضلك ادخل اسمك الأول";
                                  }
                                  return null;
                                },
                                controller: firstNameController,
                                onSaved: (value) => firstname = value,
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
                                  hintText: 'First name',
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: width * 0.35,
                              height: height*0.1,
                              child: TextFormField(
                                validator: (input){
                                  if(input.isEmpty){
                                    return "من فضلك ادخل اسمك الثاني";
                                  }
                                  return null;
                                },
                                onSaved: (value) => lastname = value,
                                controller: lastNameController,
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
                                  hintText: 'Last name',
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: width * 0.8,
                          height: height*0.1,
                          child: TextFormField(
                            validator: (input){
                              if(input.isEmpty || !input.contains('@')){
                                return "من فضلك ادخل البريد الالكتروني";
                              }
                              return null;
                            },
                            onSaved: (value) => email= value,
                            controller: emailController,
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

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: width * 0.17,
                              height: height*0.1,
                              child: TextFormField(
                                keyboardType: TextInputType.phone,
                                validator: (input){
                                  if(!input.contains('+') || !(input.length <= 3)){
                                    return "خطأ";
                                  }
                                  return null;
                                },
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
                                  hintText: '+966',
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: width * 0.6,
                              height: height*0.1,
                              child: TextFormField(
                                validator: (input){
                                  if(input.isEmpty){
                                    return "تأكد من ادخال كود المنطقة ورقم الهاتف ";
                                  }
                                  return null;
                                },
                                onSaved: (value) => telephone = value,
                                controller: phoneController,
                                keyboardType: TextInputType.phone,
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
                                  hintText: '55xxxxxxx',
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: width * 0.8,
                          height: height*0.1,
                          child: TextFormField(
                            validator: validatePassword,
                            onSaved: (value) => password = value,
                            controller: passwordController,
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
                        SizedBox(
                          height: 30,
                        ),
                          _isLoading ?CircularProgressIndicator():SizedBox(
                          width: width,
                          height: 44,
                          child: RaisedButton(
                            onPressed: () async {
                              setState(() {
                                _isLoading = true;
                              });
                             await _submit();
                            },
                            color: colorm6,
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
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "أو تسجيل بأستخدام",
                          style: text1.copyWith(color: colorm7),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SingleChildScrollView(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: width * 0.16,
                                height: 35,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
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
                                width: width * 0.16,
                                height: 35,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  color: Colors.white,
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                      'assets/images/ic_google.png'),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: width * 0.16,
                                height: 35,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
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
                                width: width * 0.16,
                                height: 35,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
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
                        SizedBox(
                          height: 20,
                        ),
                      ],
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
