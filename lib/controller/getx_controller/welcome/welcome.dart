import 'package:get/get.dart';
import 'package:getx_api_design_practice/view/screen/auth/sign_in.dart';

class WelcomeController extends GetxController {
  RxBool isLoading = false.obs;

  welcomeFun() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.put(() => const SignIn());
  }

  @override
  void onInit() {
    welcomeFun();
    super.onInit();
  }
}
