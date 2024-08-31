import 'dart:convert';
import 'dart:developer';
import 'package:getx_api_design_practice/controller/local_storage/local_storage.dart';
import 'package:http/http.dart' as http;
import 'package:getx_api_design_practice/controller/api_controller/apis.dart';

class ProductDeleteCartService {
  static Future<bool> productDeleteCartService({required int id}) async {
    try {
      String token = await LocalStorage().readData(key: 'token') ?? '';

      Uri url = Uri.parse(Apis.productdeletecart);

      var body = {"product_id": id};

      final headers = {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      };

      var response = await http.post(url,body: jsonEncode(body), headers: headers);
      log(" res ${response.statusCode}");

      if(response.statusCode ==201){
        return true;
      }else if(response.statusCode ==200){
        return true;
      }

    } catch (e) {
      log("error :$e");
    }
    return false;
  }
}
