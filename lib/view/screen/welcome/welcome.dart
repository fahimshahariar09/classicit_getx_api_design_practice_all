import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api_design_practice/controller/getx_controller/welcome/welcome.dart';
import 'package:getx_api_design_practice/view/screen/auth/sign_in.dart';
class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    WelcomeController welcomeController =Get.put(WelcomeController());
    return Scaffold(
      body: InkWell(
        onTap: (){
          welcomeController.welcomeFun();
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/undraw_login_re_4vu2 1.png"),
            ],
          ),
        ),
      ),
    );
  }
}
