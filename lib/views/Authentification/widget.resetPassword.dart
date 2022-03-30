import 'package:flutter/material.dart';
import 'package:tiki/controllers/resetPasswordController.dart';
import 'package:sizer/sizer.dart';
import '../../constWidgets/progressIndicator.dart';
import 'components/component.back.dart';
import 'package:get/get.dart';

import 'components/component.button.dart';


class ResetPasswordWidget extends StatefulWidget {
  const ResetPasswordWidget({Key? key}) : super(key: key);

  @override
  _ResetPasswordWidgetState createState() => _ResetPasswordWidgetState();
}

class _ResetPasswordWidgetState extends State<ResetPasswordWidget> {
  @override
  Widget build(BuildContext context) {
    final controller =
    Get.put<ResetPasswordController>(ResetPasswordController());

    return SafeArea(child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 7.w),
        child: Column(
          children: [
            backWidget,
            Column(
              children: [],
            ),
            Obx(() => controller.isSending.value == false
                ? button("Send", () async {
              await controller.forgetPassword();
            })
                : circularProgressModel())



          ],
        ),
      ),
    ));
  }
}
