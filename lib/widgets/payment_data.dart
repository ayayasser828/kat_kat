import 'package:flutter/material.dart';
import 'package:kat_kat/constant/constant.dart';


class PaymentData extends StatefulWidget {
  @override
  _PaymentDataState createState() => _PaymentDataState();
}

class _PaymentDataState extends State<PaymentData> {
  bool checkedValue = false;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Container(
          height: height*0.73,
          width: width,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 35,vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                      width: width,
                      alignment: Alignment.center,
                      child: Text('الدفع', style:textA23,)),
                  SizedBox(height: 20,),
                  Image.asset('assets/images/img_visa.png'),
                  SizedBox(height: 20,),
                  Text('رقم البطاقة الائتمانية',style: textA24.copyWith(fontSize: 15),),
                  SizedBox(height: 20,),
                  Container(
                    width: width,
                    height: 38,
                    child: Material(
                      borderRadius: BorderRadius.all(Radius.circular(23)),
                      elevation: 2,
                      shadowColor: Colors.white,
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: '1234 1234 1234 1234',
                            contentPadding:
                            EdgeInsets.symmetric(horizontal: 10),
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(23)),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('تاريخ الانتهاء',style: textA24.copyWith(fontSize: 15),),
                            SizedBox(height: 20,),
                            Container(
                              width: width * 0.25,
                              height: 38,
                              child: Material(
                                borderRadius: BorderRadius.all(Radius.circular(23)),
                                elevation: 2,
                                shadowColor: Colors.white,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: '23/5',
                                    contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(23)),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('CVV',style: textA24.copyWith(fontSize: 15),),
                            SizedBox(height: 20,),
                            Container(
                              width: width * 0.25,
                              height: 38,
                              child: Material(
                                borderRadius: BorderRadius.all(Radius.circular(23)),
                                elevation: 2,
                                shadowColor: Colors.white,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: '123',
                                    contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(23)),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30,),
                  Text('اسم حامل البطاقة',style: textA24.copyWith(fontSize: 15),),
                  SizedBox(height: 20,),
                  Container(
                    width: width * 0.7,
                    height: 38,
                    child: Material(
                      borderRadius: BorderRadius.all(Radius.circular(23)),
                      elevation: 2,
                      shadowColor: Colors.white,
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'احمد حمدي',
                            contentPadding:
                            EdgeInsets.symmetric(horizontal: 10),
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(23)),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: CheckboxListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 0),
                      title: Text('احفظ البطاقة',style: textA24.copyWith(fontSize: 15),),
                      value: checkedValue,
                      onChanged: (newValue){
                        setState(() {
                          checkedValue = newValue;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  ),
                  SizedBox(height: 30,),
                  SizedBox(
                    /// Button
                    width: width,
                    height: 44,
                    child: RaisedButton(
                      color: colorm6,
                      child: Text(
                        'ادفع',
                        style: text1.copyWith(color: Colors.white),
                      ),
                      onPressed: (){},
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(13))),
                    ),
                  ),
                  SizedBox(height: 20,),
                ],
              ),
            ),
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(41))
          ),
        ),

      ],
    );
  }
}
