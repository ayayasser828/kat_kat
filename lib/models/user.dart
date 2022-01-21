
import 'package:flutter/cupertino.dart';


class User with ChangeNotifier {

  User({
    this.customer,
    this.password,
    this.redirectUrl,
  });




  Customer customer;
  String password;
  String redirectUrl;



  Map<String, dynamic> toJson() => {
    "customer": customer.toJson(),
    "password": password,
    "redirectUrl": redirectUrl,
  };

}

class Customer {
  Customer({
    this.email,
    this.firstname,
    this.lastname,
    this.addresses,
  });

  String email;
  String firstname;
  String lastname ;
  List<Address> addresses;

  Map<String, dynamic> toJson() => {
    "email": email,
    "firstname": firstname,
    "lastname": lastname,
    "addresses": List<dynamic>.from(addresses.map((x) => x.toJson())),
  };
}

class Address {
  Address({
    this.telephone,
  });

  String telephone;

  Map<String, dynamic> toJson() => {
    "telephone": telephone,
  };
}

