import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tiki/controllers/resetPasswordController.dart';

import '../../../constWidgets/progressIndicator.dart';
import '../../../data/font.data.dart';
import '../../../data/pallete.data.dart';
import '../../Authentification/components/component.back.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

import '../../Authentification/components/component.button.dart';
import '../../Authentification/components/component.inputPassword.dart';

class ResetPasswordWidget extends StatefulWidget {
  const ResetPasswordWidget({Key? key}) : super(key: key);

  @override
  _ResetPasswordWidgetState createState() => _ResetPasswordWidgetState();
}

class _ResetPasswordWidgetState extends State<ResetPasswordWidget> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ResetPasswordController());
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: KOrange,
        elevation: 0,
        centerTitle: true,
        title: Text(
            "reset_password".tr,
          style: TextStyle(fontSize: 15.sp, fontWeight: medium),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        height: 100.h,
        width: 100.w,
        color: KOrange,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12.sp),
                  topLeft: Radius.circular(12.sp)),
              color: Colors.white),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 7.w),
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  SizedBox(
                      height: 30.h,
                      child: LottieBuilder.asset(
                          "assets/animation/85012-password-security.json")),
                  SizedBox(height: 2.h),
                  InputComponentPassword(
                    hintText:  "current_password".tr,
                    textEditingController: controller.passwordController,
                    validate: controller.validatePassword,
                  ),
                  SizedBox(height: 3.h),
                  InputComponentPassword(
                    hintText: 'new_password',
                    textEditingController: controller.newPasswordController,
                    validate: controller.validateConfirmPassword,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Obx(() => controller.isSending.value == false
                      ? button("reset".tr, () async {
                          await controller.resetPassword();
                        })
                      : circularProgressModel()),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
