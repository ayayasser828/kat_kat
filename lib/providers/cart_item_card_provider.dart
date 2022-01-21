import 'package:flutter/cupertino.dart';
import 'package:kat_kat/models/cart_product.dart';

class CartProducts with ChangeNotifier{

  List<CartProduct> _list = [
    CartProduct(
      id: 1,
      img: 'assets/images/ps.png',
      name: 'بطاقة بلايستيشن سعودي',
      price: '200 SR',
      cardclass: '10 دولار',
      count: 1,
    ),
    CartProduct(
      id: 2,
      img: 'assets/images/nf.png',
      name: 'بطاقة بلايستيشن سعودي',
      price: '200 SR',
      cardclass: '10 دولار',
      count: 2,
    ),
    CartProduct(
      id: 3,
      img: 'assets/images/ps.png',
      name: 'بطاقة بلايستيشن سعودي',
      price: '200 SR',
      cardclass: '10 دولار',
      count: 3,
    ),
    CartProduct(
      id: 4,
      img: 'assets/images/nf.png',
      name: 'بطاقة بلايستيشن سعودي',
      price: '200 SR',
      cardclass: '10 دولار',
      count: 4,
    ),
    CartProduct(
      id: 5,
      img: 'assets/images/ps.png',
      name: 'بطاقة بلايستيشن سعودي',
      price: '200 SR',
      cardclass: '10 دولار',
      count: 5,
    ),
    CartProduct(
      id: 6,
      img: 'assets/images/nf.png',
      name: 'بطاقة بلايستيشن سعودي',
      price: '200 SR',
      cardclass: '10 دولار',
      count: 6,
    ),
    CartProduct(
      id: 7,
      img: 'assets/images/ps.png',
      name: 'بطاقة بلايستيشن سعودي',
      price: '200 SR',
      cardclass: '10 دولار',
      count: 7,
    ),
    CartProduct(
      id: 8,
      img: 'assets/images/nf.png',
      name: 'بطاقة بلايستيشن سعودي',
      price: '200 SR',
      cardclass: '10 دولار',
      count: 8,
    ),
  ];

  List<CartProduct> get item{
    return _list;
  }


}