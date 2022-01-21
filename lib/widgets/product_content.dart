import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kat_kat/constant/constant.dart';
import 'package:kat_kat/providers/product_details_service.dart';
import 'package:provider/provider.dart';

class ProductContent extends StatefulWidget {
  @override
  _ProductContentState createState() => _ProductContentState();
}

class _ProductContentState extends State<ProductContent> {
  bool price1 = false;
  bool price2 = false;
  bool price3 = false;
  bool price4 = false;
  bool price5 = false;
  bool price6 = false;
  bool price7 = false;
  bool price8 = false;
  bool price9 = false;
  bool price10 = false;
  bool uk = false;
  bool us = false;
  bool sa = false;
  int counter = 1;
  bool isFavorite = false;



  void priceSelected(int index) {
    setState(() {
      if (index == 0) {
        price1 = true;
        price2 = false;
        price3 = false;
        price4 = false;
        price5 = false;
        price6 = false;
        price7 = false;
        price8 = false;
        price9 = false;
        price10 = false;
      } else if (index == 1) {
        price1 = false;
        price2 = true;
        price3 = false;
        price4 = false;
        price5 = false;
        price6 = false;
        price7 = false;
        price8 = false;
        price9 = false;
        price10 = false;
      } else if (index == 2) {
        price1 = false;
        price2 = false;
        price3 = true;
        price4 = false;
        price5 = false;
        price6 = false;
        price7 = false;
        price8 = false;
        price9 = false;
        price10 = false;
      } else if (index == 3) {
        price1 = false;
        price2 = false;
        price3 = false;
        price4 = true;
        price5 = false;
        price6 = false;
        price7 = false;
        price8 = false;
        price9 = false;
        price10 = false;
      } else if (index == 4) {
        price1 = false;
        price2 = false;
        price3 = false;
        price4 = false;
        price5 = true;
        price6 = false;
        price7 = false;
        price8 = false;
        price9 = false;
        price10 = false;
      } else if(index == 5){
        price1 = false;
        price2 = false;
        price3 = false;
        price4 = false;
        price5 = false;
        price6 = true;
        price7 = false;
        price8 = false;
        price9 = false;
        price10 = false;
      } else if(index == 6){
        price1 = false;
        price2 = false;
        price3 = false;
        price4 = false;
        price5 = false;
        price6 = false;
        price7 = true;
        price8 = false;
        price9 = false;
        price10 = false;
      } else if(index == 7){
        price1 = false;
        price2 = false;
        price3 = false;
        price4 = false;
        price5 = false;
        price6 = false;
        price7 = false;
        price8 = true;
        price9 = false;
        price10 = false;
      } else if(index == 8){
        price1 = false;
        price2 = false;
        price3 = false;
        price4 = false;
        price5 = false;
        price6 = false;
        price7 = false;
        price8 = false;
        price9 = true;
        price10 = false;
      } else if(index == 9){
        price1 = false;
        price2 = false;
        price3 = false;
        price4 = false;
        price5 = false;
        price6 = false;
        price7 = false;
        price8 = false;
        price9 = false;
        price10 = true;
      }
    });
  }

  void storeSelected(int index) {
    setState(() {
      if (index == 0) {
        uk = true;
        us = false;
        sa = false;
      } else if (index == 1) {
        uk = false;
        us = true;
        sa = false;
      } else if (index == 2) {
        uk = false;
        us = false;
        sa = true;
      }
    });
  }

  void addValue() {
    setState(() {
      counter++;
    });
  }

  void removeValue() {
    setState(() {
      if (counter > 1) counter--;
    });
  }

  void addToFavorites() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getData();
  }


  getData(){
    var details= Provider.of<ProductDetailsService>(context).productDetails;
    counter = details.totalCount;
  }


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;


    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Container(
            width: width,
            height: height*0.41,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'اختر المتجر',
                    style: textA13,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            storeSelected(1);
                          });
                        },
                        child: Container(
                          child: Image.asset('assets/images/us.png'),
                          alignment: Alignment.center,
                          width: us? 50:34,
                          height:  us? 50:34,
                          decoration: BoxDecoration(
                            // border: us ? Border.all(color: colorA7) : null,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            storeSelected(2);
                          });
                        },
                        child: Container(
                          child: Image.asset('assets/images/sa.png'),
                          alignment: Alignment.center,
                          width: sa? 50:34,
                          height: sa? 50:34,
                          decoration: BoxDecoration(
                            // border: sa ? Border.all(color: colorA7) : null,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'الفئة السعرية',
                    style: textA13,
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 7,vertical: 7),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      priceSelected(0);
                                    });
                                  },
                                  child: Material(
                                    shadowColor: price1? Colors.grey: Colors.transparent,
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                    elevation: 1,
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 53,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          color: price1 ? Colors.white : colorA9,
                                          // border: price1 ? Border.all(color: colorA7) : null,
                                          borderRadius: BorderRadius.all(Radius.circular(5))
                                      ),
                                      child: Text(
                                        '40 \$',
                                        style: textA20,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20,),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      priceSelected(1);
                                    });
                                  },
                                  child: Material(
                                    shadowColor: price2? Colors.grey: Colors.transparent,
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                    elevation: 1,
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 53,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: price2 ? Colors.white : colorA9,
                                        // border: price2 ? Border.all(color: colorA7) : null,
                                        borderRadius: BorderRadius.all(Radius.circular(8)),
                                      ),
                                      child: Text(
                                        '30 \$',
                                        style: textA20,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20,),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      priceSelected(2);
                                    });
                                  },
                                  child: Material(
                                    shadowColor: price3? Colors.grey: Colors.transparent,
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                    elevation: 1,
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 53,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: price3 ? Colors.white : colorA9,
                                        // border: price3 ? Border.all(color: colorA7) : null,
                                        borderRadius: BorderRadius.all(Radius.circular(8)),
                                      ),
                                      child: Text(
                                        '20 \$',
                                        style: textA20,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20,),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      priceSelected(3);
                                    });
                                  },
                                  child: Material(
                                    shadowColor: price4? Colors.grey: Colors.transparent,
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                    elevation: 1,
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 53,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: price4 ? Colors.white : colorA9,
                                        // border: price4 ? Border.all(color: colorA7) : null,
                                        borderRadius: BorderRadius.all(Radius.circular(8)),
                                      ),
                                      child: Text(
                                        '15 \$',
                                        style: textA20,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20,),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      priceSelected(4);
                                    });
                                  },
                                  child: Material(
                                    shadowColor: price5? Colors.grey: Colors.transparent,
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                    elevation: 1,
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 53,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: price5 ? Colors.white : colorA9,
                                        // border: price5 ? Border.all(color: colorA7) : null,
                                        borderRadius: BorderRadius.all(Radius.circular(8)),
                                      ),
                                      child: Text(
                                        '10 \$',
                                        style: textA20,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      priceSelected(5);
                                    });
                                  },
                                  child: Material(
                                    shadowColor: price6? Colors.grey: Colors.transparent,
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                    elevation: 1,
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 53,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          color: price6 ? Colors.white : colorA9,
                                          // border: price1 ? Border.all(color: colorA7) : null,
                                          borderRadius: BorderRadius.all(Radius.circular(5))
                                      ),
                                      child: Text(
                                        '100 \$',
                                        style: textA20,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20,),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      priceSelected(6);
                                    });
                                  },
                                  child: Material(
                                    shadowColor: price7? Colors.grey: Colors.transparent,
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                    elevation: 1,
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 53,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: price7 ? Colors.white : colorA9,
                                        // border: price2 ? Border.all(color: colorA7) : null,
                                        borderRadius: BorderRadius.all(Radius.circular(8)),
                                      ),
                                      child: Text(
                                        '80 \$',
                                        style: textA20,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20,),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      priceSelected(7);
                                    });
                                  },
                                  child: Material(
                                    shadowColor: price8? Colors.grey: Colors.transparent,
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                    elevation: 1,
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 53,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: price8 ? Colors.white : colorA9,
                                        // border: price3 ? Border.all(color: colorA7) : null,
                                        borderRadius: BorderRadius.all(Radius.circular(8)),
                                      ),
                                      child: Text(
                                        '70 \$',
                                        style: textA20,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20,),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      priceSelected(8);
                                    });
                                  },
                                  child: Material(
                                    shadowColor: price9? Colors.grey: Colors.transparent,
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                    elevation: 1,
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 53,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: price9? Colors.white : colorA9,
                                        // border: price4 ? Border.all(color: colorA7) : null,
                                        borderRadius: BorderRadius.all(Radius.circular(8)),
                                      ),
                                      child: Text(
                                        '60 \$',
                                        style: textA20,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20,),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      priceSelected(9);
                                    });
                                  },
                                  child: Material(
                                    shadowColor: price10? Colors.grey: Colors.transparent,
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                    elevation: 1,
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 53,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: price10 ? Colors.white : colorA9,
                                        // border: price5 ? Border.all(color: colorA7) : null,
                                        borderRadius: BorderRadius.all(Radius.circular(8)),
                                      ),
                                      child: Text(
                                        '50 \$',
                                        style: textA20,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    'متوفرة',
                    style: textA14,
                  ),
                  SizedBox(height: 10,),
                  Text(
                    'العدد',
                    style: textA12,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 118,
                        height: 71,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('المجموع النهائي',style: textA9.copyWith(fontWeight: FontWeight.bold),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('ريال',style: textA14.copyWith(color: colorA8),),
                                SizedBox(width: 10,),
                                Text('40',style: textm12.copyWith(color: colorm9,fontWeight: FontWeight.bold,fontSize: 21),),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Container(
                          width: width*0.3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: 37,
                                height: 35,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(color: Colors.grey, blurRadius: 3)
                                  ],
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                  color: Colors.white,
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    removeValue();
                                  },
                                  icon: Icon(
                                    Icons.remove,
                                    color: colorm7,
                                    size: 22,
                                  ),
                                ),
                              ),
                              Text(
                                '${counter}',
                                style: textA13,
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 37,
                                height: 35,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(color: Colors.grey, blurRadius: 3)
                                  ],
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                  color: Colors.white,
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    addValue();
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    color: colorm7,
                                    size: 22,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]
                  ),
                  SizedBox(height: 20,),
                ],
              ),
            ),
          ),
        ),
        Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            alignment: Alignment.center,
            height: height*0.09,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    /// Button
                    width: width * 0.6,
                    height: 44,
                    child: RaisedButton(
                      color: colorm6,
                      child: Text(
                        'إضافة إلى السلة',
                        style: text1.copyWith(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(13))),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('ادفع',style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                        FaIcon(FontAwesomeIcons.apple,size: 18,),
                      ],
                    ),
                    width: 60,
                    height: 38,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        border: Border.all(color: Colors.black,width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(5))
                    ),
                  ),
                  // InkWell(
                  //   onTap: () {
                  //     setState(() {
                  //       addToFavorites();
                  //     });
                  //   },
                  //   child: Container(
                  //     alignment: Alignment.center,
                  //     width: 44,
                  //     height: 44,
                  //     decoration: BoxDecoration(
                  //       color: Colors.white,
                  //       borderRadius: BorderRadius.all(Radius.circular(12)),
                  //     ),
                  //     child: isFavorite
                  //         ? Icon(
                  //       Icons.favorite,
                  //       color: Colors.red,
                  //     )
                  //         : Icon(
                  //       Icons.favorite_border,
                  //       color: Colors.red,
                  //     ),
                  //   ),
                  // ),

                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
