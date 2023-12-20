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
  }
}
