import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:getx_api_design_practice/controller/api_controller/authentication/apis.dart';
import 'package:http/http.dart' as http;

class SignUpService {
  static Future<bool> signUpService({required Map<String,dynamic> data}) async {
    try {
      Uri url = Uri.parse(Apis.register);

      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Accept": "application/json"
      };

      var body= jsonEncode(data);

      var response = await http.post(url,body: body,headers: headers);

      if(response.statusCode==201){
        Get.snackbar("message", "Registration Success");
        return true;
      }else if(response.statusCode==422){
        var responseData= jsonDecode(response.body)['errors'];
        List a =responseData.keys.toList();

        if(a.contains("email")){
          Get.snackbar("message", "The email has already been used.");
          return false;
        }else if(a.contains("phone")){
          Get.snackbar("message", "The phone has already been used.");
          return false;
        }
      }

    } catch (e) {
      log("error:$e");
    }
    Get.snackbar("message", "something went wrong");
    return false;
  }
}
