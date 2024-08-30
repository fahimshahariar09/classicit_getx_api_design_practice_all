
import 'dart:convert';
import 'dart:developer';
import 'package:getx_api_design_practice/controller/api_controller/apis.dart';
import 'package:getx_api_design_practice/model/product_detalis_model.dart';
import 'package:http/http.dart' as http;

class ProductDetalisService{
  static Future<ProductDetails?> productDetalisService()async{

    try{

      Uri url = Uri.parse(Apis.productdetalis);

      var response = await http.get(url);
      if(response.statusCode==200){
        ProductDetalisModel model = ProductDetalisModel.fromJson(jsonDecode(response.body));
        return model.productDetails;
      }

    }catch (e){
      log("error :$e");
    }
    return null;
    
  }
}