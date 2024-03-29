import 'package:flutter/material.dart';
import 'package:tiki/controllers/resetPasswordForgetController.dart';
import 'package:sizer/sizer.dart';
import 'package:tiki/data/font.data.dart';
import '../../constWidgets/progressIndicator.dart';
import 'components/component.back.dart';
import 'package:get/get.dart';

import 'components/component.button.dart';
import 'components/component.inputPassword.dart';

class ResetPasswordForgetWidget extends StatefulWidget {
  ResetPasswordForgetWidget({required this.email,required this.token,Key? key}) : super(key: key);
  String email;
  String? token ;

  @override
  _ResetPasswordForgetWidgetState createState() => _ResetPasswordForgetWidgetState();
}

class _ResetPasswordForgetWidgetState extends State<ResetPasswordForgetWidget> {
  @override
  Widget build(BuildContext context) {
    final controller =
    Get.put<ResetPasswordForgetController>(ResetPasswordForgetController(email : widget.email,token: widget.token));

    return SafeArea(
        child: Scaffold(
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
                      Text("enter_your_new_password".tr , style: TextStyle(fontSize: 15.sp, fontWeight: bold),),
                      SizedBox(height: 7.h),
                      InputComponentPassword(
                        hintText: 'password'.tr,
                        textEditingController: controller.passwordController,
                        validate: controller.validatePassword,
                      ),
                      SizedBox(height: 3.h),
                      InputComponentPassword(
                        hintText: 'confirmPassword'.tr,
                        textEditingController: controller.confirmPasswordController,
                        validate:  controller.validateConfirmPassword,
                      ),
                    ],
                  ),
                  Obx(() => controller.isSending.value == false
                      ? button("confirm".tr, () async {
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
