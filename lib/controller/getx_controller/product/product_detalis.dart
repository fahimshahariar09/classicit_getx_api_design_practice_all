

import 'package:get/get.dart';
import 'package:getx_api_design_practice/controller/api_controller/product/product_detalis.dart';
import 'package:getx_api_design_practice/model/product_detalis_model.dart';

class ProductDetalisController extends GetxController{
  ProductDetails? productDetails;
  RxBool isLoading =false.obs;
  RxList<dynamic> image =[].obs;

  productDetalisFun()async{
    isLoading.value =true;
    productDetails = await ProductDetalisService.productDetalisService();
    image(productDetails?.images);
    isLoading.value =false;
  }


  @override
  void onInit() {
    productDetalisFun();
    super.onInit();
  }

}