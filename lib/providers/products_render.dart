



import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:kat_kat/helper/url.dart';
import 'package:kat_kat/models/product-render.dart';

class ProductsRender with ChangeNotifier{

  String urlProductsRenderInfo = "products-render-info?searchCriteria[currentPage]=1&storeId=1&currencyCode=SAR";
  ProductRender productRender  ;


  Future<void>  productsRenderInfo() async {
    String url= "$baseUrl$urlProductsRenderInfo";
    try{
      Response response = await Dio().get(
          url,
      );
      print(response.data);
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        productRender = ProductRender.fromMap(response.data);
      }else{
        print('not a 200 requesy ${response.data}');
      }

    }on DioError catch(error){
      print(error);

    }

  }





}