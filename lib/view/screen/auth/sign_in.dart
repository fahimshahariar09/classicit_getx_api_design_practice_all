
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api_design_practice/controller/getx_controller/authentication/sign_in.dart';
import 'package:getx_api_design_practice/view/common_widget/common_button.dart';
import 'package:getx_api_design_practice/view/common_widget/common_loading_button.dart';
import 'package:getx_api_design_practice/view/common_widget/common_text.dart';
import 'package:getx_api_design_practice/view/screen/auth/sign_up.dart';
import 'package:getx_api_design_practice/view/screen/auth/widget/email_text_field.dart';
import 'package:getx_api_design_practice/view/screen/auth/widget/pass_text_field.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    SignInController signInController = Get.put(SignInController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            key: signInController.formKey,
            child: Column(
              children: [
                buildSizedBox(height: 10),
                CommonText(titel: "Sign In here",fSize: 20,fColor: Colors.black,fWeight: FontWeight.bold,),
                buildSizedBox(height: 20),
                Text("Welcome back you've\nbeen missed!",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
                buildSizedBox(height: 20),
                EmailTextField(
                  emailController: signInController.emailController,
                ),
                buildSizedBox(height: 10),
                PassTextField(
                    passwordController: signInController.passwordController),
                buildSizedBox(height: 20),
                Obx(
                  () => signInController.isLoading.isFalse
                      ? CommonButton(
                          buttonName: "Sign In",
                          onTap: () {
                            if (!signInController.formKey.currentState!
                                .validate()) {
                              return;
                            }
                            signInController.signInFun();
                          })
                      : const CommonLoadingButton(),
                ),
                buildSizedBox(height: 20),
                GestureDetector(
                    onTap: (){
                      Get.to(()=>SignUp());
                    },
                    child: CommonText(titel: "Create new Account",fColor: Colors.black,fSize: 18,)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox buildSizedBox({double? height, double? width}) =>
      SizedBox(height: height, width: width);
}
