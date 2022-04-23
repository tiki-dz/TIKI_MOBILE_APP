import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tiki/controllers/resetPasswordController.dart';

import '../../../constWidgets/progressIndicator.dart';
import '../../../data/font.data.dart';
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
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 7.w),
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  backWidget,

                  Column(
                    children: [
                      Text("Reset password" , style: TextStyle(fontSize: 15.sp, fontWeight: bold),),
                      SizedBox(height: 30.h,child: LottieBuilder.asset("assets/animation/85012-password-security.json")),


                      SizedBox(height: 2.h),
                      InputComponentPassword(
                        hintText: 'current password',
                        textEditingController: controller.passwordController,
                        validate: controller.validatePassword,
                      ),
                      SizedBox(height: 3.h),
                      InputComponentPassword(
                        hintText: 'new password',
                        textEditingController: controller.newPasswordController,
                        validate:  controller.validateConfirmPassword,
                      ),
                      SizedBox(height: 20.h,)
                    ],
                  ),
                  Obx(() => controller.isSending.value == false
                      ? button("Reset", () async {
                    await controller.resetPassword();
                  })
                      : circularProgressModel())
                ],
              ),
            ),
          ),
        ));
  }
}
