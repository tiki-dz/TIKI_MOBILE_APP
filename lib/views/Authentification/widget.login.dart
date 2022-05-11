import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiki/views/Authentification/widget.forgetPassword.dart';
import 'package:tiki/views/Authentification/widget.signup.dart';
import 'package:tiki/views/ButtomBar/widget.bottomBar.dart';
import 'package:tiki/views/Home/widget.home.dart';
import '../../constWidgets/progressIndicator.dart';
import '../../controllers/LogInController.dart';
import '../../data/font.data.dart';
import '../../data/pallete.data.dart';
import 'package:sizer/sizer.dart';
import "package:flutter_svg/flutter_svg.dart";
import 'package:dotted_line/dotted_line.dart';

import 'components/component.button.dart';
import 'components/component.input.dart';
import 'components/component.inputPassword.dart';

class LogInWidget extends StatefulWidget {
  const LogInWidget({Key? key}) : super(key: key);

  @override
  _LogInWidgetState createState() => _LogInWidgetState();
}

class _LogInWidgetState extends State<LogInWidget> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LogInController());
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 3.h),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 7.w),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: () {
                            Get.offAll(const BottomBarWidget());
                          },
                          child: SvgPicture.asset(
                              'assets/icons/fi-rr-cross-small.svg'),
                        ),
                      ),
                      Expanded(child: Image.asset('assets/logo/logo.png')),
                      Text(
                        "sing_up_to".tr,
                        style: TextStyle(fontSize: 10.sp, fontWeight: medium),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      InputComponent(
                          leadingIcon: 'assets/icons/fi-rr-envelope.svg',
                          hintText: 'email'.tr,
                          textEditingController: controller.emailController,validate: controller.validateEmail,),
                      SizedBox(height: 2.h),
                      InputComponentPassword(
                        hintText: 'password'.tr,
                        textEditingController: controller.passwordController,
                        validate: controller.validatePassword,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: () {
                            Get.to(ForgetPasswordWidget());
                          },
                          child: Text(
                            "forget_password_?".tr,
                            style:
                                TextStyle(fontSize: 10.sp, fontWeight: regular),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Obx(() => controller.isUpdating.value == false
                          ? button("login".tr, () async {
                              FocusManager.instance.primaryFocus?.unfocus();

                              await controller.login();
                            })
                          : circularProgressModel()),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            Row(
              children: [
                Expanded(child: Divider(thickness: 0.1.h)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: Text(
                    "or".tr,
                    style: TextStyle(fontSize: 12.sp, fontWeight: medium),
                  ),
                ),
                Expanded(
                    child: Divider(
                  thickness: 0.1.h,
                )),
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              "log_in_with".tr,
              style: TextStyle(fontSize: 12.sp, fontWeight: medium),
            ),
            SizedBox(
              height: 3.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  containerConnectWith("edit"),
                  containerConnectWith("edit"),
                  containerConnectWith("edit")
                ],
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            InkWell(
              onTap: () {
                Get.to(const SignUpWidget());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "not_account".tr,
                    style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: medium,
                        color: SecondaryTextColor),
                  ),
                  Text(
                    'signup'.tr,
                    style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: semiBold,
                        color: ButtonColor),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}

Widget containerConnectWith(String icon) => Container(
      padding: EdgeInsets.all(12.sp),
      decoration: BoxDecoration(
        border: Border.all(color: KOrange),
        shape: BoxShape.circle,
      ),
      child: SvgPicture.asset(
        "assets/icons/$icon.svg",
        height: 20,
        width: 20,
        color: KOrange,
      ),
    );