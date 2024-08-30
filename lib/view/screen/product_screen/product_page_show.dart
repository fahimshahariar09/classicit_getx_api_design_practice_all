import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api_design_practice/controller/getx_controller/product/product_page_show.dart';
import 'package:getx_api_design_practice/view/common_widget/common_text.dart';
import 'package:getx_api_design_practice/view/screen/product_screen/product_detalis_page.dart';

class ProductPageShow extends StatelessWidget {
  const ProductPageShow({super.key});

  @override
  Widget build(BuildContext context) {
    ProductPageShowController productpageShowController =
        Get.put(ProductPageShowController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Show"),
        centerTitle: true,
      ),
      body: Obx(() => productpageShowController.isLoading.isFalse
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: productpageShowController.products?.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.5),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.to(() => const ProductDetalisPage());
                      },
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                                "https://cit-ecommerce-codecanyon.bandhantrade.com/${productpageShowController.products?[index].image}"),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonText(
                                    titel:
                                        "${productpageShowController.products?[index].nameEn}",
                                    maxLine: 2,
                                    fSize: 15,
                                    fColor: Colors.black,
                                  ),
                                  Text(
                                    "price: ${productpageShowController.products?[index].regPrice}",
                                    style: const TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                                  ),
                                  Text(
                                    "rating: ${productpageShowController.products?[index].rating}",
                                    style: const TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }))
          : const CircularProgressIndicator()),
    );
  }
}
