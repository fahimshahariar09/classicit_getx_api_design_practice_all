import 'dart:convert';
import 'dart:developer';
import 'package:getx_api_design_practice/controller/api_controller/apis.dart';
import 'package:getx_api_design_practice/controller/local_storage/local_storage.dart';
import 'package:http/http.dart' as http;

class ProductAddToCart {
  static Future<bool> productaddtoCart({required int id}) async {
    try {
      Uri url = Uri.parse(Apis.productaddtocart);

      String token = await LocalStorage().readData(key: "token") ?? '';

      var body = {
        "product_id": id,
        "product_qty": 1
      };

      final headers = {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      };

      var response = await http.post(url, body: jsonEncode(body), headers: headers);
      log(".........${response.statusCode}");
      log(".........${response.body}");
      if(response.statusCode==201){
        return true;
      }else if(response.statusCode==200){
        return true;
      }

    } catch (e) {
      log("error:$e");
    }
    return false;
  }
}
