


import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:kat_kat/helper/url.dart';
import 'package:kat_kat/models/product_details.dart';

class ProductDetailsService with ChangeNotifier{


  String urlProductDetailsPart1 = "products?searchCriteria[filterGroups][0][filters][0][field]=entity_id&searchCriteria[filterGroups][0][filters][0][value]=";
  String urlProductDetailsPart2 = "&searchCriteria[filterGroups][0][filters][0][conditionType]=eq&searchCriteria[pageSize]=1&storeId=1&currencyCode=USD";
  ProductDetails productDetails;



  Future<void>  getProductDetails(int id) async {
    String url= "$baseUrl$urlProductDetailsPart1$id$urlProductDetailsPart2";
    try{
      Response response = await Dio().get(
        url,
      );
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        productDetails = ProductDetails.fromMap(response.data);
        print(productDetails.items[0].name);

      }else{
        print('not a 200 requesy ${response.data}');
      }

    }on DioError catch(error){
      print(error);

    }

  }


}