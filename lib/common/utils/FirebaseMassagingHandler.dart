import 'package:chat_app/common/apis/apis.dart';
import 'package:chat_app/common/entities/entities.dart';
import 'package:chat_app/common/routes/names.dart';
import 'package:chat_app/common/store/store.dart';
import 'package:chat_app/common/values/values.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseMassagingHandler {
  FirebaseMassagingHandler._();
  static AndroidNotificationChannel channelcall =
      const AndroidNotificationChannel(
    'com.dbestech.chat_app.call', // id
    'chat_app_call', // title
    importance: Importance.max,
    enableLights: true,
    playSound: true,
    sound: RawResourceAndroidNotificationSound('alert'),
  );
  static AndroidNotificationChannel channelmessage =
      const AndroidNotificationChannel(
    'com.dbestech.chat_app.message', // id
    'chat_app_message', // title
    importance: Importance.defaultImportance,
    enableLights: true,
    playSound: true,
    // sound: RawResourceAndroidNotificationSound('alert'),
  );

  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> config() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    try {
      RemoteMessage newMessage = const RemoteMessage();
      await messaging.requestPermission(
        sound: true,
        badge: true,
        alert: true,
        announcement: false,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
      );

      RemoteMessage? initialMessage =
          await FirebaseMessaging.instance.getInitialMessage();
      if (initialMessage != null) {
        print("initialMessage------");
        print(initialMessage);
      }
      var initializationSettingsAndroid =
          const AndroidInitializationSettings("ic_launcher");
      var darwinInitializationSettings = const DarwinInitializationSettings();
      var initializationSettings = InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: darwinInitializationSettings);
      flutterLocalNotificationsPlugin.initialize(initializationSettings,
          onDidReceiveNotificationResponse: (value) {
        print("----------onDidReceiveNotificationResponse");
      });

      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
              alert: true, badge: true, sound: true);

      FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
        print("\n notification on onMessage function \n");
        print(message);
        _receiveNotification(message);
      });
    } on Exception catch (e) {
      print("$e");
    }
  }

  static Future<void> _receiveNotification(RemoteMessage message) async {
    if (message.data != null && message.data["call_type"] != null) {
      //  ////1. voice 2. video 3. text, 4.cancel
      if (message.data["call_type"] == "voice") {
        //  FirebaseMassagingHandler.flutterLocalNotificationsPlugin.cancelAll();
        var data = message.data;
        var totoken = data["token"];
        var toname = data["name"];
        var toavatar = data["avatar"];
        var docid = data["docid"] ?? "";
        // var call_role= data["call_type"];
        if (totoken != null && toname != null && toavatar != null) {
          Get.snackbar(
              icon: Container(
                width: 40.w,
                height: 40.w,
                padding: EdgeInsets.all(0.w),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill, image: NetworkImage(toavatar)),
                  borderRadius: BorderRadius.all(Radius.circular(20.w)),
                ),
              ),
              "${toname}",
              "Voice call",
              duration: const Duration(seconds: 30),
              isDismissible: false,
              mainButton: TextButton(
                  onPressed: () {},
                  child: Container(
                      width: 90.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (Get.isSnackbarOpen) {
                                Get.closeAllSnackbars();
                              }
                              FirebaseMassagingHandler._sendNotifications(
                                  "cancel", totoken, toavatar, toname, docid);
                            },
                            child: Container(
                              width: 40.w,
                              height: 40.w,
                              padding: EdgeInsets.all(10.w),
                              decoration: BoxDecoration(
                                color: AppColors.primaryElementBg,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.w)),
                              ),
                              child: Image.asset("assets/icons/a_phone.png"),
                            ),
                          ),
                          GestureDetector(
                              onTap: () {
                                if (Get.isSnackbarOpen) {
                                  Get.closeAllSnackbars();
                                }
                                Get.toNamed(AppRoutes.VoiceCall, parameters: {
                                  "totoken": totoken,
                                  "toname": toname,
                                  "toavatar": toavatar,
                                  "docid": docid,
                                  "call_role": "audience"
                                });
                              },
                              child: Container(
                                width: 40.w,
                                height: 40.w,
                                padding: EdgeInsets.all(10.w),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryElementStatus,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.w)),
                                ),
                                child:
                                    Image.asset("assets/icons/a_telephone.png"),
                              ))
                        ],
                      ))));
        }
      } else if (message.data["call_type"] == "video") {
        //    FirebaseMassagingHandler.flutterLocalNotificationsPlugin.cancelAll();
        //  ////1. voice 2. video 3. text, 4.cancel
        var data = message.data;
        var totoken = data["token"];
        var toname = data["name"];
        var toavatar = data["avatar"];
        var docid = data["docid"] ?? "";
        // var callrole= data["calltype"];
        if (totoken != null && toname != null && toavatar != null) {
          ConfigStore.to.isCallVocie = true;
          Get.snackbar(
              icon: Container(
                width: 40.w,
                height: 40.w,
                padding: EdgeInsets.all(0.w),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill, image: NetworkImage(toavatar)),
                  borderRadius: BorderRadius.all(Radius.circular(20.w)),
                ),
              ),
              "${toname}",
              "Video call",
              duration: const Duration(seconds: 30),
              isDismissible: false,
              mainButton: TextButton(
                  onPressed: () {},
                  child: Container(
                      width: 90.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (Get.isSnackbarOpen) {
                                Get.closeAllSnackbars();
                              }
                              FirebaseMassagingHandler._sendNotifications(
                                  "cancel", totoken, toavatar, toname, docid);
                            },
                            child: Container(
                              width: 40.w,
                              height: 40.w,
                              padding: EdgeInsets.all(10.w),
                              decoration: BoxDecoration(
                                color: AppColors.primaryElementBg,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.w)),
                              ),
                              child: Image.asset("assets/icons/a_phone.png"),
                            ),
                          ),
                          GestureDetector(
                              onTap: () {
                                if (Get.isSnackbarOpen) {
                                  Get.closeAllSnackbars();
                                }
                                Get.toNamed(AppRoutes.VideoCall, parameters: {
                                  "totoken": totoken,
                                  "toname": toname,
                                  "toavatar": toavatar,
                                  "docid": docid,
                                  "call_role": "audience"
                                });
                              },
                              child: Container(
                                width: 40.w,
                                height: 40.w,
                                padding: EdgeInsets.all(10.w),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryElementStatus,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.w)),
                                ),
                                child:
                                    Image.asset("assets/icons/a_telephone.png"),
                              ))
                        ],
                      ))));
        }
      } else if (message.data["call_type"] == "cancel") {
        FirebaseMassagingHandler.flutterLocalNotificationsPlugin.cancelAll();

        if (Get.isSnackbarOpen) {
          Get.closeAllSnackbars();
        }

        if (Get.currentRoute.contains(AppRoutes.VoiceCall) ||
            Get.currentRoute.contains(AppRoutes.VideoCall)) {
          Get.back();
        }

        var prefs = await SharedPreferences.getInstance();
        await prefs.setString("CallVocieOrVideo", "");
      }
    }
  }

  static Future<void> _sendNotifications(String calltype, String totoken,
      String toavatar, String toname, String docid) async {
    CallRequestEntity callRequestEntity = CallRequestEntity();
    callRequestEntity.calltype = calltype;
    callRequestEntity.totoken = totoken;
    callRequestEntity.toavatar = toavatar;
    callRequestEntity.docid = docid;
    callRequestEntity.toname = toname;
    var res = await ChatAPI.callnotifications(params: callRequestEntity);
    print("sendNotifications");
    print(res);
    if (res.code == 0) {
      print("sendNotifications success");
    } else {
      // Get.snackbar("Tips", "Notification error!");
      // Get.offAllNamed(AppRoutes.Message);
    }
  }

  static Future<void> _showNotification({RemoteMessage? message}) async {
    RemoteNotification? notification = message!.notification;
    AndroidNotification? androidNotification = message.notification!.android;
    AppleNotification? appleNotification = message.notification!.apple;

    if (notification != null &&
        (androidNotification != null || appleNotification != null)) {
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channelmessage.id,
            channelmessage.name,
            icon: "@mipmap/ic_launcher",
            playSound: true,
            enableVibration: true,
            priority: Priority.defaultPriority,
            // channelShowBadge: true,
            importance: Importance.defaultImportance,
            // sound: RawResourceAndroidNotificationSound('alert'),
          ),
          iOS: const DarwinNotificationDetails(
            presentAlert: true,
            presentBadge: true,
            presentSound: true,
          ),
        ),
        payload: message.data.toString(),
      );
    }
    // PlascoRequests().initReport();
  }
/*
  @pragma('vm:entry-point')
  static Future<void> firebaseMessagingBackground(RemoteMessage message) async {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
    print("message data: ${message.data}");
    print("message data: ${message}");
    print("message data: ${message.notification}");

    if(message!=null){
      if(message.data!=null && message.data["call_type"]!=null) {

        if(message.data["call_type"]=="cancel"){
            FirebaseMassagingHandler.flutterLocalNotificationsPlugin.cancelAll();
          //  await setCallVocieOrVideo(false);
            var _prefs = await SharedPreferences.getInstance();
            await _prefs.setString("CallVocieOrVideo", "");
        }
        if(message.data["call_type"]=="voice" || message.data["call_type"]=="video"){

          var data = {
            "to_token":message.data["token"],
            "to_name":message.data["name"],
            "to_avatar":message.data["avatar"],
            "doc_id":message.data["doc_id"]??"",
            "call_type":message.data["call_type"],
            "expire_time":DateTime.now().toString(),
          };
          print(data);
          var _prefs = await SharedPreferences.getInstance();
          await _prefs.setString("CallVocieOrVideo", jsonEncode(data));
        }


      }



    }

  }*/
}
