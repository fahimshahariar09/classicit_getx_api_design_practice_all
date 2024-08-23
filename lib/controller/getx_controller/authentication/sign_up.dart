import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_api_design_practice/controller/api_controller/authentication/sign_up.dart';

class SignUpController extends GetxController {
  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordconfirmationController =
      TextEditingController();

  RxBool isLoading = false.obs;

  signUpFun() async {
    Map<String, dynamic> data = {
      "email": emailController.text,
      "phone": phoneController.text,
      "password": passwordController.text,
      "password_confirmation": passwordconfirmationController.text
    };

    isLoading.value = true;
    bool status = await SignUpService.signUpService(data: data);
    isLoading.value = false;

    if(status){
      return;
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    passwordconfirmationController.dispose();
    super.dispose();
  }
}
