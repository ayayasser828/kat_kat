import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kat_kat/constant/constant.dart';
import 'package:kat_kat/models/cart_product.dart';

class CartItemCard extends StatefulWidget {
  final CartProduct cartProduct;

  const CartItemCard({this.cartProduct});

  @override
  _CartItemCardState createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {



  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:5,vertical: 10),
      child: Stack(
        children: [
          Material(
            elevation: 2,
            borderRadius: BorderRadius.circular(17),
            color: Colors.white,
            child: Container(
              // color: Colors.red,
              width: width,
              height: 135,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            width: width*0.5,
                            height:height*0.08,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '${widget.cartProduct.name}',
                                  style: textA20,
                                  textDirection: TextDirection.rtl,
                                ),
                                Text(
                                  '${widget.cartProduct.cardclass}',
                                  style: textA20,
                                  textDirection: TextDirection.rtl,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            width: width * 0.47,
                            child: Row(
                              textDirection: TextDirection.rtl,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        widget.cartProduct.remove();
                                        setState(() {
                                        });
                                      },
                                      child: Container(
                                        child: Icon(
                                          Icons.remove,
                                          size: 15,
                                        ),
                                        alignment: Alignment.center,
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: colorA11),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '${widget.cartProduct.count}',
                                      style: textP1,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        widget.cartProduct.add();
                                        setState(() {
                                        });
                                      },
                                      child: Container(
                                        child: Icon(
                                          Icons.add,
                                          size: 15,
                                        ),
                                        alignment: Alignment.center,
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: colorA11),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  '${widget.cartProduct.price}',
                                  style: textA6,
                                  textDirection: TextDirection.ltr,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 101,
                        height: 65,
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.5,color: Colors.grey),
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(widget.cartProduct.img),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0.0,
            left: 5.0,
            child: InkWell(
              onTap:(){
                // Navigator.of(context).pop();
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Image.asset("assets/images/no.png",width: 20,height: 20,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
