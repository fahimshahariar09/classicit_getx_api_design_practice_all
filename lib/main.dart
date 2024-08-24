
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api_design_practice/view/screen/auth/sign_up.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const GetMaterialApp (
      debugShowCheckedModeBanner: false,
      home: SignUp(),
    );
  }
}
