import 'package:flutter/material.dart';
import 'package:kat_kat/constant/constant.dart';
import 'package:kat_kat/screens/product_order.dart';



class CustomBottomSheetProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      height: height*0.8,
      color: Colors.transparent,
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Positioned(
            top: 60,
            child: Container(
              height: height*0.8-60,
              width: width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(41),topLeft: Radius.circular(41))
                ),
              child: SingleChildScrollView(
                child: Padding(
                  padding:  EdgeInsets.only(
                    top: 80,
                    bottom: 40
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.arrow_back_ios,color: colorm7,size: 20,),
                        SizedBox(width: 10,),
                        Text("ملفي الشخصي",style: textm15),
                          SizedBox(width: 15,),
                      ],),
                      Text("سامر العيتيبي",style: textm8,),
                      Text("جدة ،السعودية",style: textm9,),
                      SizedBox(height: 20,),
                      Divider(height: 10,thickness: 1,),
                      SizedBox(height: 20,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.of(context).pushNamed(ProductOrderScreen.routeName);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.arrow_back_ios,color: color3,size: 20,),
                                SizedBox(width: 40,),
                                Text("مشترياتي",style: textm10,),
                              ],
                            ),
                          ),
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.arrow_back_ios,color: color3,size: 20,),
                              SizedBox(width: 40,),
                              Text("المفضلة",style: textm10,),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.arrow_back_ios,color: color3,size: 20,),
                              SizedBox(width: 40,),
                              Text("بطاقاتي",style: textm10,),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.arrow_back_ios,color: color3,size: 20,),
                              SizedBox(width: 40,),
                              Text("الضبط",style: textm10,),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.exit_to_app,color: colorm9,size: 20,),
                              SizedBox(width: 40,),
                              Text("تسجيل خروج",style: textm16,),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 60,
            child: Container(
              height: 60,
              width: width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(50.0),
                ),
              ),
            ),
          ),
          Positioned(
            top: 1,
            child: Container(
              child: Image.asset("assets/images/profile.png",height: 120,width: 117,),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(50.0),
                ),
              ),
            ),
          ),
          Positioned(
            top: 80,
            right: 40,
            child: Column(
              children: <Widget>[
                InkWell(
                  onTap:(){
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Image.asset("assets/images/no.png",width: 26,height: 26,),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


