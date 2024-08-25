
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api_design_practice/view/screen/product_screen/product_page.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const GetMaterialApp (
      debugShowCheckedModeBanner: false,
      home: ProductPage(),
    );
  }
}
