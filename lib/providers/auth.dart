import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:kat_kat/helper/url.dart';
import 'package:kat_kat/models/user.dart';

class Auth with ChangeNotifier {
  User user = User();

  Future<void> signup () async {
    try {

      // final String url = '${baseUrl + "/customers"}';
      // final response = await Dio().post(url,
      //     data: json.encode(user.toJson()));
      // print(json.decode(response.data));
      // if (response.statusCode >= 200 && response.statusCode <= 299) {
      //   print("success");
      // } else {
      //   print('not a 200 request ${response.data}');
      //   print("something is wrong");
      // }
    } on DioError catch (e) {
      print(e.response);
      return e.response.data["message"];
    }
    return null;
  }
}
