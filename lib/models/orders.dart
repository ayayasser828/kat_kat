


import 'package:kat_kat/models/cart.dart';

class Order{

  final String name;
  final double price;
  final String date;
  final int id;
  final String state;
  final List<Cart> cart;

  Order({this.name, this.price, this.date, this.id, this.state,this.cart});
}