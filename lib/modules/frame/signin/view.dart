import 'package:chat_app/common/style/color.dart';
import 'package:chat_app/common/values/values.dart';
import 'package:chat_app/modules/frame/signin/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignInPage extends GetView<SignInController> {
  const SignInPage({super.key});

  //logo
  Widget _buildLogo() {
    return Container(
      margin: EdgeInsets.only(top: 100.h, bottom: 80.h),
      child: Text(
        "chat app",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: AppColor.primaryText,
            fontWeight: FontWeight.bold,
            fontSize: 34.sp),
      ),
    );
  }

  Widget _buildThirdyPartyLogin(String loginType, String logo) {
    return Container(
      padding: EdgeInsets.all(10.h),
      margin: EdgeInsets.only(bottom: 15.h),
      width: 295.w,
      height: 44.h,
      decoration: BoxDecoration(
          color: AppColors.primaryBackground,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, 1))
          ]),
      child: Row(
        mainAxisAlignment:
            logo == '' ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: [
          logo == ''
              ? Container()
              : Container(
                  padding: EdgeInsets.only(left: 40.w, right: 30.w),
                  child: Image.asset("assets/icons/$logo.png"),
                ),
          Container(
            child: Text(
              "sign in with $loginType",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColor.primaryText,
                  fontWeight: FontWeight.normal,
                  fontSize: 14.sp),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildorWidget() {
    return Container(
      margin: EdgeInsets.only(top: 20.h, bottom: 35.h),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              indent: 50,
              height: 2.h,
              color: AppColors.primarySecondaryElementText,
            ),
          ),
          const Text(" or "),
          Expanded(
            child: Divider(
              endIndent: 50,
              height: 2.h,
              color: AppColors.primarySecondaryElementText,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primarySecondaryBackground,
      body: Center(
          child: Column(
        children: [
          _buildLogo(),
          _buildThirdyPartyLogin("Google", "google"),
          _buildThirdyPartyLogin("Facebook", "facebook"),
          _buildThirdyPartyLogin("Apple", "apple"),
          _buildorWidget(),
          _buildThirdyPartyLogin("phone number", ""),
          SizedBox(
            height: 35.h,
          ),
          Column(
            children: [
              Text(
                "Already have an account",
                style: TextStyle(
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.normal,
                    fontSize: 12.sp),
              ),
              GestureDetector(
                child: Text(
                  "Sign up here",
                  style: TextStyle(
                      color: AppColors.primaryElement,
                      fontWeight: FontWeight.normal,
                      fontSize: 12.sp),
                ),
              )
            ],
          )
        ],
      )),
    );
  }
}
