import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api_design_practice/controller/getx_controller/authentication/sign_up.dart';
import 'package:getx_api_design_practice/view/common_widget/common_button.dart';
import 'package:getx_api_design_practice/view/common_widget/common_loading_button.dart';
import 'package:getx_api_design_practice/view/common_widget/common_text.dart';
import 'package:getx_api_design_practice/view/screen/auth/sign_in.dart';
import 'package:getx_api_design_practice/view/screen/auth/widget/confram_pass_text_field.dart';
import 'package:getx_api_design_practice/view/screen/auth/widget/email_text_field.dart';
import 'package:getx_api_design_practice/view/screen/auth/widget/pass_text_field.dart';
import 'package:getx_api_design_practice/view/screen/auth/widget/phone_text_field.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpController signUpController = Get.put(SignUpController());
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: signUpController.formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    buildSizedBox(height: 20),
                    const CommonText(titel: "Create Account",fSize: 18,fColor: Colors.black,fWeight: FontWeight.bold,),
                    buildSizedBox(height: 10),
                    const Text("Create an account so you can explore all the\nexisting jobs",style: TextStyle(fontWeight: FontWeight.w600,),textAlign: TextAlign.center,),
                    buildSizedBox(height: 20),
                    EmailTextField(
                      emailController: signUpController.emailController,
                    ),
                    buildSizedBox(height: 10),
                    PhoneTextField(
                      phoneController: signUpController.phoneController,
                    ),
                    buildSizedBox(height: 10),
                    PassTextField(
                      passwordController: signUpController.passwordController,
                    ),
                    buildSizedBox(height: 10),
                    ConframPassTextField(
                      confarmpasswordController:
                          signUpController.passwordconfirmationController,
                    ),
                    buildSizedBox(height: 20),
                    Obx(
                      () => signUpController.isLoading.isFalse
                          ? CommonButton(
                              buttonName: "Sign Up",
                              onTap: () {
                                log("message");
                                if (!signUpController.formKey.currentState!
                                    .validate()) {
                                  return;
                                }
                                signUpController.signUpFun();
                              })
                          : const CommonLoadingButton(),
                    ),
                    buildSizedBox(height: 20),
                    GestureDetector(
                        onTap: (){
                          Get.to(()=>const SignIn());
                        },
                        child: const CommonText(titel: "Already have an account",fColor: Colors.black,)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox buildSizedBox({double? height, double? width}) =>
      SizedBox(height: height, width: width);
}
