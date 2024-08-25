
import 'package:get/get.dart';
import 'package:getx_api_design_practice/controller/api_controller/product/product_show.dart';
import 'package:getx_api_design_practice/model/product_show_model.dart';

class ProductShowController extends GetxController{

  List<Products>? products;
  RxBool isLoading = false.obs;



  productShowFun()async{
    isLoading.value=true;
    products = await ProductShowService.productShow();
    isLoading.value=false;
  }

  @override
  void onInit() {
    productShowFun();
    super.onInit();
  }
}