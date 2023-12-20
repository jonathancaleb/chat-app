import 'package:chat_app/modules/frame/welcome/controller.dart';
import 'package:get/get.dart';

/*here we perform a dependency injection */

class WelcomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WelcomeController>(() => WelcomeController());
  }
}
