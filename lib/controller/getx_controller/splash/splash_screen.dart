import 'dart:async';

import 'package:get/get.dart';
import 'package:getx_api_design_practice/controller/local_storage/local_storage.dart';
import 'package:getx_api_design_practice/view/screen/auth/sign_up.dart';
import 'package:getx_api_design_practice/view/screen/product_screen/product_page_show.dart';

class SplashScreenController extends GetxController {
  RxBool isLoading = false.obs;

  splashscreenFun() async {
    String token= await LocalStorage().readData(key: "token") ??'';
    await Future.delayed(const Duration(seconds: 2));
    if(token.isNotEmpty || token !=""){
      Get.to(()=>const ProductPageShow());
    }else{
      Get.to(()=>const SignUp());
    }
  }

  @override
  void onInit() {
    splashscreenFun();
    super.onInit();
  }
}
