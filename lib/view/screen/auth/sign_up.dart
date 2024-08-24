import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api_design_practice/controller/getx_controller/authentication/sign_up.dart';
import 'package:getx_api_design_practice/view/common_widget/common_button.dart';
import 'package:getx_api_design_practice/view/common_widget/common_loading_button.dart';
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
              child: Column(
                children: [
                  buildSizedBox(height: 200),
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
                ],
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
