


import 'package:get/get.dart';
import 'package:getx_api_design_practice/controller/api_controller/product/product_delete_cart.dart';
import 'package:getx_api_design_practice/controller/api_controller/product/product_show_cart.dart';
import 'package:getx_api_design_practice/model/product_show_cart_model.dart';

class ProductShowCartController extends GetxController{

  List<ProductCart>? productCart;

  RxBool isLoading =false.obs;

  productshowcartFun()async{
    isLoading.value =true;
    productCart = await ProductShowCartService.productshowcart();
    isLoading.value =false;
  }

  productdeletecartFun({required int id})async{
    isLoading.value =true;
    bool status = await ProductDeleteCartService.productDeleteCartService(id: id);
    isLoading.value =false;

   if(status){
     productshowcartFun();
   }
  }

  @override
  void onInit() {
    productshowcartFun();
    super.onInit();
  }

}