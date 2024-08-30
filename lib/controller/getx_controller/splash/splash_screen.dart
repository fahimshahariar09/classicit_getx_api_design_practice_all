import 'dart:async';

import 'package:get/get.dart';
import 'package:getx_api_design_practice/view/screen/auth/sign_in.dart';

class SplashScreenController extends GetxController {
  RxBool isLoading = false.obs;

  splashscreenFun() async {
   await Future.delayed(const Duration(seconds: 3));
   Get.to(()=>const SignIn());

  }

  @override
  void onInit() {
    splashscreenFun();
    super.onInit();
  }
}
