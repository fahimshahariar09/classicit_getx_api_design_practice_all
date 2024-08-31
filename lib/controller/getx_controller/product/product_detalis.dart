

import 'dart:developer';

import 'package:get/get.dart';
import 'package:getx_api_design_practice/controller/api_controller/product/product_add_to_cart.dart';
import 'package:getx_api_design_practice/controller/api_controller/product/product_detalis.dart';
import 'package:getx_api_design_practice/model/product_detalis_model.dart';

class ProductDetalisController extends GetxController{
  ProductDetails? productDetails;
  RxBool isLoading =false.obs;
  RxList<dynamic> image =[].obs;

  productDetalisFun()async{
    isLoading.value =true;
    var data = await Get.arguments ?? 0;
    productDetails = await ProductDetalisService.productDetalisService(id: data);
    image(productDetails?.images);
    isLoading.value =false;
  }

  addtocartFun({required int id})async{
    bool status = await ProductAddToCart.productaddtoCart(id: id);
    log("message:$status");
    if(status ){
      Get.back();
    }
  }

  @override
  void onInit() {
    productDetalisFun();
    super.onInit();
  }

}