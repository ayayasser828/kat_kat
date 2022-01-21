import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kat_kat/constant/constant.dart';
import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:kat_kat/providers/product_details_service.dart';
import 'package:kat_kat/widgets/description_content.dart';
import 'package:kat_kat/widgets/product_content.dart';
import 'package:kat_kat/widgets/rate_content.dart';
import 'package:provider/provider.dart';

class ProductPge extends StatefulWidget {

  static const String routeName = "/ProductPge";
  final int idProduct;
  ProductPge({this.idProduct});

  @override
  _ProductPgeState createState() => _ProductPgeState();
}

class _ProductPgeState extends State<ProductPge> {
  bool product = true;
  bool description = false;
  bool rate = false;
  bool _isLooding = true;

  void contentSelected(int index) {
    setState(() {
      if (index == 0) {
        product = true;
        description = false;
        rate = false;
      } else if (index == 1) {
        product = false;
        description = true;
        rate = false;
      } else if (index == 2) {
        product = false;
        description = false;
        rate = true;
      }
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDetails();
  }


  Future<void> getDetails()async{
    await Provider.of<ProductDetailsService>(context,listen: false).getProductDetails(widget.idProduct).then((value){
      setState(() {
        _isLooding = false;
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: width,
        height: height,
        child: Column(
          children: [
            Stack(
              children: [
               Arc(
                        arcType: ArcType.CONVEX,
                        edge: Edge.BOTTOM,
                        height: 40.0,
                        child: Container(
                          width: width,
                          height: height * 0.38,
                          decoration: BoxDecoration(
                            color: colorA13,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(50.0),
                              bottomRight: Radius.circular(50.0),
                            ),
                          ),
                        ),
                      ),
                Positioned(
                  child: Container(
                           width: width,
                           height: height * 0.38,
                           child: Image.asset('assets/images/product_logo.png',fit: BoxFit.fill,),
                         ),
                ),
                Positioned(
                  top: 30.0,
                  right: 30.0,
                  child: InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: width*0.35,
                      height: height*0.12,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            width: 26,
                            height: 26,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: Icon(
                              Icons.close,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                              child: product? Text('شراء البطاقة', style: textA1): null),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: height*0.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      contentSelected(2);
                    },
                    child: Material(
                      borderRadius:
                      BorderRadius.all(Radius.circular(17)),
                      elevation: 1,
                      child: Container(
                        alignment: Alignment.center,
                        width: 73,
                        height: 27,
                        decoration: BoxDecoration(
                            color: rate? Colors.white:colorA9,
                            // border: price1 ? Border.all(color: colorA7) : null,
                            borderRadius: BorderRadius.all(
                                Radius.circular(17))),
                        child: Text(
                          'التقييم',
                          style: textA5.copyWith(color: colorm7),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        contentSelected(1);
                      });
                    },
                    child: Material(
                      borderRadius:
                      BorderRadius.all(Radius.circular(17)),
                      elevation: 1,
                      child: Container(
                        alignment: Alignment.center,
                        width: 73,
                        height: 27,
                        decoration: BoxDecoration(
                            color: description? Colors.white:colorA9,
                            // border: price1 ? Border.all(color: colorA7) : null,
                            borderRadius: BorderRadius.all(
                                Radius.circular(17))),
                        child: Text(
                          'الوصف',
                          style: textA5.copyWith(color: colorm7),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        contentSelected(0);
                      });
                    },
                    child: Material(
                      borderRadius:
                      BorderRadius.all(Radius.circular(17)),
                      elevation: 1,
                      child: Container(
                        alignment: Alignment.center,
                        width: 73,
                        height: 27,
                        decoration: BoxDecoration(
                            color: product? Colors.white:colorA9,
                            // border: price1 ? Border.all(color: colorA7) : null,
                            borderRadius: BorderRadius.all(
                                Radius.circular(17))),
                        child: Text(
                          'المنتج',
                          style: textA5.copyWith(color: colorm7),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: height*0.5,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: _isLooding?Center(child: CircularProgressIndicator()):Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    product ? ProductContent() : Container(),
                    description ? DescriptionContent() : Container(),
                    rate ? RateContent() : Container(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
