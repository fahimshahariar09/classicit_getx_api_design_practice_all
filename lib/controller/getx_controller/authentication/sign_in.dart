



import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_api_design_practice/controller/api_controller/authentication/sign_in.dart';

class SignInController extends GetxController{

  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool isLoading = false.obs;
  
  signInFun()async{
    isLoading.value = true;
    bool status = await SignInService.signInService(email: emailController.text, password: passwordController.text);
    isLoading.value = false;

    if(status){
     // Get.to(()=>const TextPage());
      return;
    }
  }
  
  
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}