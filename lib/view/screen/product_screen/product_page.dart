import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api_design_practice/controller/getx_controller/product/product_show.dart';
import 'package:getx_api_design_practice/view/common_widget/common_text.dart';
import 'package:getx_api_design_practice/view/screen/product_screen/product_detalis_page.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    ProductShowController productShowController =
        Get.put(ProductShowController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Show"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            // CommonText(
            //   titel: "Total item :${productShowController.products?.length}",
            //   fColor: Colors.black,
            //   fSize: 15,
            //   fWeight: FontWeight.w400,
            // ),
            const SizedBox(
              height: 15,
            ),
            Obx(() => productShowController.isLoading.isFalse
                ? Expanded(
                    child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: productShowController.products?.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                childAspectRatio: 0.6),
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
                                      "https://media.istockphoto.com/id/1958337605/photo/portrait-of-a-woman-using-laptop-while-sitting-on-a-mint-couch-at-home.webp?b=1&s=612x612&w=0&k=20&c=01N6BcDlqkp_9VwTwvJQN2J7mZvb7Txorm1lgyooNPc="),

                                  // Image.network(
                                  //     "https://cit-ecommerce-codecanyon.bandhantrade.com/${productShowController.products?[index].image}"),

                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "name: ${productShowController.products?[index].nameEn}",
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14),
                                        ),
                                        Text(
                                          "price: ${productShowController.products?[index].regPrice}",
                                          style: const TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14),
                                        ),
                                        Text(
                                          "rating: ${productShowController.products?[index].rating}",
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
                        }),
                  )
                : const CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }
}
