
import 'dart:convert';
import 'dart:developer';
import 'package:getx_api_design_practice/controller/local_storage/local_storage.dart';
import 'package:getx_api_design_practice/model/product_show_cart_model.dart';
import 'package:http/http.dart' as http;
import 'package:getx_api_design_practice/controller/api_controller/apis.dart';

class ProductShowCartService {
  static Future<List<ProductCart>> productshowcart() async {
    try {
      Uri url = Uri.parse(Apis.productshowcart);
     String token = await LocalStorage().readData(key: 'token') ?? '';
      final headers = {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      };

      var response = await http.get(url,headers: headers);
      if(response.statusCode ==200){
        ProductShowCartModel model = ProductShowCartModel.fromJson(jsonDecode(response.body));

        return model.productCart??[];
      }
    } catch (e) {
      log("error :$e");
    }
    return [];
  }
}
