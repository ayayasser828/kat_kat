import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kat_kat/helper/url.dart';

import 'package:kat_kat/models/user.dart';
import 'package:kat_kat/models/user_data.dart';

class UserProvider with ChangeNotifier {


  Dio dio = Dio();
  UserData userData;
  String _urlSignup = "customers";



  Future<String> registerUser(User user) async {
    try {
      var dataBody = user.toJson();
      String url = "$baseUrl$_urlSignup";
      final response = await dio.post(url, data: dataBody);
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        userData = UserData.fromMap(response.data);
        notifyListeners();
        return "success";
      } else {
        print('not a 200 request ${response.data}');
        print ("something is wrong");
      }
    } on DioError catch (e) {
      print(e.response);
      if(e.response.data["message"] == "A customer with the same email address already exists in an associated website."){
         return "Email already exists";
      }
      return e.response.data["message"];

    }
  }
}
