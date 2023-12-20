import 'package:chat_app/common/routes/routes.dart';
import 'package:chat_app/modules/frame/welcome/state.dart';
import 'package:get/get.dart';

class WelcomeController extends GetxController {
  WelcomeController();
  final title = "chat app";
  final state = WelcomeState();

  /// functions
  @override
  void onReady() {
    super.onReady();
    Get.log("welcomecontroller");

    //go to sign in page
    Future.delayed(
        const Duration(seconds: 3), () => Get.offAllNamed(AppRoutes.message));
  }
}
