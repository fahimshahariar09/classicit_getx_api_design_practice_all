import 'dart:convert';
import 'dart:developer';
import 'package:getx_api_design_practice/controller/api_controller/apis.dart';
import 'package:getx_api_design_practice/model/product_page_show_model.dart';
import 'package:http/http.dart' as http;

class ProductPageShowService {
  static Future<List<Products>> productShow() async {
    try {
      Uri url = Uri.parse(Apis.productshow);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        ProductPageShowModel model =
            ProductPageShowModel.fromJson(jsonDecode(response.body));
        return model.products ?? [];
      }
    } catch (e) {
      log("error:$e");
    }
    return [];
  }
}
