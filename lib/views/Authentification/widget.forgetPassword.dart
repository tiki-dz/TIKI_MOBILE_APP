import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tiki/controllers/forgetPasswordController.dart';
import 'package:tiki/data/font.data.dart';

import '../../constWidgets/progressIndicator.dart';
import 'components/component.back.dart';
import 'components/component.button.dart';
import 'components/component.input.dart';

class ForgetPasswordWidget extends StatefulWidget {
  const ForgetPasswordWidget({Key? key}) : super(key: key);

  @override
  _ForgetPasswordWidgetState createState() => _ForgetPasswordWidgetState();
}

class _ForgetPasswordWidgetState extends State<ForgetPasswordWidget> {
  @override
  Widget build(BuildContext context) {
    final controller =
        Get.put<ForgetPasswordController>(ForgetPasswordController());
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 7.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            backWidget,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Reénitialision mot de passe",
                  style: TextStyle(fontSize: 17.sp, fontWeight: semiBold),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "Entrez votre email et vous allez recevoir \nun code dans votre boite",
                  style: TextStyle(fontSize: 11.sp, fontWeight: regular),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 8.h,
                ),
                InputComponent(
                    leadingIcon: 'assets/icons/fi-rr-envelope.svg',
                    hintText: 'email'.tr,
                    textEditingController: controller.emailController),
              ],
            ),
            Obx(() => controller.isSending.value == false
                ? button("Send", () async {
                    await controller.forgetPassword();
                  })
                : circularProgressModel()),
          ],
        ),
      ),
    ));
  }
}
