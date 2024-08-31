import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api_design_practice/controller/api_controller/apis.dart';
import 'package:getx_api_design_practice/controller/getx_controller/product/product_show_cart.dart';
import 'package:getx_api_design_practice/view/common_widget/common_text.dart';

class ProductShowCart extends StatelessWidget {
  const ProductShowCart({super.key});

  @override
  Widget build(BuildContext context) {
    ProductShowCartController productShowCartController =
        Get.put(ProductShowCartController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Show Cart"),
        centerTitle: true,
      ),
      body: Obx(() => productShowCartController.isLoading.isTrue
          ? const CircularProgressIndicator()
          : ListView.builder(
              itemCount: productShowCartController.productCart?.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2,
                  color: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: SizedBox(
                      height: 120,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: 100,
                                width: 100,
                                child: Image.network(
                                  "${Apis.baseIp}/${productShowCartController.productCart?[index].productImage}",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CommonText(
                                      titel:
                                          "${productShowCartController.productCart?[index].productName?.en}",
                                      maxLine: 2,
                                      fColor: Colors.black,
                                      fSize: 13,
                                    ),
                                    CommonText(
                                      titel:
                                          "${productShowCartController.productCart?[index].discountPrice}",
                                      fColor: Colors.black,
                                      fSize: 13,
                                    ),
                                    CommonText(
                                      titel:
                                          "${productShowCartController.productCart?[index].salePrice}",
                                      fColor: Colors.black,
                                      fSize: 13,
                                    ),
                                    CommonText(
                                      titel:
                                          "${productShowCartController.productCart?[index].quantity}",
                                      fColor: Colors.black,
                                      fSize: 13,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                productShowCartController.productdeletecartFun(
                                    id: productShowCartController
                                            .productCart?[index].productId ??
                                        0);
                              },
                              icon: const Icon(Icons.delete)),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )),
    );
  }
}

// ListView.builder(
// itemCount: productShowCartController.productCart?.length,
// itemBuilder: (context, index) {
// return Row(
// children: [
// SizedBox(
// height: 80,
// width: 80,
// child: Image.network(
// "${Apis.baseIp}/${productShowCartController.productCart?[index].productImage}")),
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: Column(
// children: [
// Text(
// "${productShowCartController.productCart?[index].productId}"),
// Text(
// "${productShowCartController.productCart?[index].discountType}"),
// Text(
// "${productShowCartController.productCart?[index].productName?.en}"),
// Text(
// "${productShowCartController.productCart?[index].quantity}"),
// ],
// ),
// )
// ],
// );
// })
