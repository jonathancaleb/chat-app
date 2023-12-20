import 'package:chat_app/common/entities/entities.dart';
import 'package:chat_app/modules/frame/signin/state.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInController extends GetxController {
  SignInController();

  final state = SignInState();

  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['openid']);

  Future<void> handleSignIn(String type) async {
    //1: email 2: google 3: facebook 4: apple 5: phone
    try {
      if (type == "phone number") {
        if (kDebugMode) {
          print("your are logging with phone");
        }
      } else if (type == "google") {
        var user = await _googleSignIn.signIn();
        if (user != null) {
          String? displayName = user.displayName;
          String email = user.email;
          String id = user.id;
          String photourl = user.photoUrl ?? "assets/icons/google.png";
          LoginRequestEntity loginPanelListRequestEntity = LoginRequestEntity();
          loginPanelListRequestEntity.avatar = photourl;
          loginPanelListRequestEntity.name = displayName;
          loginPanelListRequestEntity.email = email;
          loginPanelListRequestEntity.openid = id;
          loginPanelListRequestEntity.type = 2;
        }
      } else {
        if (kDebugMode) {
          print("login type not sure");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('...error with login $e');
      }
    }
  }
}
