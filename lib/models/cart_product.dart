import 'package:flutter/cupertino.dart';

class CartProduct with ChangeNotifier{
  final String img;
  final String name;
  final String price;
  final String cardclass;
  final int id ;
   int count ;
  CartProduct({this.img,this.name,this.price,this.id,this.count,this.cardclass});

  void add(){
    this.count = this.count+1;
    notifyListeners();
  }

  void remove(){
    if(this.count > 0){
      this.count = this.count - 1;
    }
    notifyListeners();
  }


}