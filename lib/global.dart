import 'package:chat_app/common/services/services.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/common/store/user.dart';
import 'package:get/get.dart';

class Global {
  /* This file helps us to load config files before the app loads e.g user info,  */
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Get.putAsync<StorageService>(() => StorageService().init());
    Get.put<UserStore>(UserStore());
  }
}
