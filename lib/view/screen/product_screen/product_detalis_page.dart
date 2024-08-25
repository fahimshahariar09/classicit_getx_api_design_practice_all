import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api_design_practice/controller/getx_controller/product/product_detalis.dart';
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
      body: Obx(() => productDetalisController.isLoading.isFalse
          ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CommonText(
                    titel: "Image",
                    fColor: Colors.black,
                    fSize: 18,
                  ),
                  const SizedBox(height: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 150,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: productDetalisController.image.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:  const EdgeInsets.symmetric(horizontal: 5),
                                child: SizedBox(
                                  height: 120,
                                  child: Image.network("https://media.istockphoto.com/id/1958337605/photo/portrait-of-a-woman-using-laptop-while-sitting-on-a-mint-couch-at-home.webp?b=1&s=612x612&w=0&k=20&c=01N6BcDlqkp_9VwTwvJQN2J7mZvb7Txorm1lgyooNPc=",width: 150,),
                                  // child: Image.network(
                                  //   "${Apis.baseIp}/${productDetalisController.image[index]}",
                                  //   fit: BoxFit.fill,
                                  // ),
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
                                "rating: ${productDetalisController.productDetails?.rating}",
                            fSize: 15,
                            fWeight: FontWeight.bold,
                            fColor: Colors.cyanAccent,
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          CommonText(
                            titel:
                                "productStock: ${productDetalisController.productDetails?.productStock}",
                            fSize: 15,
                            fWeight: FontWeight.bold,
                            fColor: Colors.cyanAccent,
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          CommonText(
                            titel:
                                "review: ${productDetalisController.productDetails?.review}",
                            fSize: 15,
                            fWeight: FontWeight.bold,
                            fColor: Colors.cyanAccent,
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
                  )
                ],
              ),
          )
          : const CircularProgressIndicator()),
    );
  }
}
