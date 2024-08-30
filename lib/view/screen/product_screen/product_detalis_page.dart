import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api_design_practice/controller/api_controller/apis.dart';
import 'package:getx_api_design_practice/controller/getx_controller/product/product_detalis.dart';
import 'package:getx_api_design_practice/view/common_widget/common_button.dart';
import 'package:getx_api_design_practice/view/common_widget/common_text.dart';

class ProductDetalisPage extends StatelessWidget {
  const ProductDetalisPage({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetalisController productDetalisController =
        Get.put(ProductDetalisController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Detalis"),
        centerTitle: true,
      ),
      body: Obx(() => productDetalisController.isLoading.isTrue
          ? const CircularProgressIndicator()
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CommonText(
                    titel: "Image",
                    fColor: Colors.black,
                    fSize: 18,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 80,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: productDetalisController.image.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Image.network(
                                  "${Apis.baseIp}/${productDetalisController.image[index]}",
                                  //fit: BoxFit.fill,
                                ),
                              );
                            }),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonText(
                            titel:
                                "Rating: ${productDetalisController.productDetails?.rating}",
                            fSize: 15,
                            fWeight: FontWeight.bold,
                            fColor: Colors.red,
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          CommonText(
                            titel:
                                "ProductStock: ${productDetalisController.productDetails?.productStock}",
                            fSize: 15,
                            fWeight: FontWeight.bold,
                            fColor: Colors.black,
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          CommonText(
                            titel:
                                "Review: ${productDetalisController.productDetails?.review}",
                            fSize: 15,
                            fWeight: FontWeight.bold,
                            fColor: Colors.blue,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          CommonText(
                            titel:
                                "description: ${productDetalisController.productDetails?.description?.en}",
                            fSize: 15,
                            fWeight: FontWeight.bold,
                            fColor: Colors.black,
                            maxLine: 6,
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      CommonButton(buttonName: "Add To Cart",buttonWidth: MediaQuery.sizeOf(context).width/2.2,textColor: Colors.black, onTap: () {}),
                      CommonButton(buttonName: "Buy Now",buttonWidth: MediaQuery.sizeOf(context).width/2.2,textColor: Colors.black, onTap: () {}),

                    ],
                  ),
                ],
              ),
            )),
    );
  }
}
