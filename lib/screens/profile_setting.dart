import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kat_kat/constant/constant.dart';





class ProfileSetting extends StatelessWidget {
  static const String routeName = "/ProfileSetting";
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30,horizontal: 20),
            child: Container(
              width: width,
              height: height,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/splash_img.png",width: 215.39,height: 181,),
                    SizedBox(height: 30,),
                    Text("إعداد الحساب",style: textA9,),
                    SizedBox(height: 30,),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("الإسم الأول",style: textA10,),
                                Container(
                                  width:width*0.4,
                                  height: 45,
                                  child: Material(
                                    borderRadius: BorderRadius.all(Radius.circular(23)),
                                    elevation: 5,
                                    shadowColor: Colors.grey,
                                    child: TextFormField(
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                        fillColor: Colors.white,
                                        filled: true,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(23)),
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                )

                              ],
                            ),
                            SizedBox(width: 20,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("الإسم الأخير",style: textA10,),
                                Container(
                                  width:width*0.4,
                                  height: 45,
                                  child: Material(
                                    borderRadius: BorderRadius.all(Radius.circular(23)),
                                    elevation: 5,
                                    shadowColor: Colors.grey,
                                    child: TextFormField(
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                        fillColor: Colors.white,
                                        filled: true,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(23)),
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                )

                              ],
                            )

                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text("المدينة",style: textA10,),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width:width*0.55,
                        height: 45,
                        child: Material(
                          borderRadius: BorderRadius.all(Radius.circular(23)),
                          elevation: 5,
                          shadowColor: Colors.grey,
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(horizontal: 10),
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(23)),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text("الرجاء إدخال رمز التحقق",style: textA10,),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width:width,
                        height: 45,
                        child: Material(
                          borderRadius: BorderRadius.all(Radius.circular(23)),
                          elevation: 5,
                          shadowColor: Colors.grey,
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(horizontal: 10),
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(23)),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),
                    SizedBox(
                      width: width,
                      height: 44,
                      child: RaisedButton(
                        onPressed: () {

                        },
                        color: colorm8,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(23))),
                        child: Center(
                          child: Text(
                            "حفظ",
                            style: textm14,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40,),




                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}



