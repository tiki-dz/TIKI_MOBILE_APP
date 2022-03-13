import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tiki/data/font.data.dart';
import 'package:tiki/data/pallete.data.dart';
import 'package:tiki/views/Authentification/components/component.button.dart';
import 'package:tiki/views/Authentification/components/component.input.dart';
import "package:flutter_svg/flutter_svg.dart";
import 'package:get/get.dart';
import 'package:tiki/views/Authentification/widget.confirmation.dart';

import '../../controllers/registration.controller.dart';
import 'components/component.inputPassword.dart';

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Scaffold(
      backgroundColor: BackGroundColor,
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 24.h,
        ),
        child: Column(children: [
          SizedBox(
            height: 20.h,
          ),
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset('assets/icons/fi-rr-cross-small.svg'),
          ),
          SizedBox(
            height: 28.3.h,
          ),
          Text(
            'signup'.tr,
            style: TextStyle(
              fontSize: 35.sp,
              fontWeight: semiBold,
            ),
          ),
          SizedBox(
            height: 46.h,
          ),
          InputComponent(
              leadingIcon: 'assets/icons/fi-rr-user.svg',
              hintText: 'name'.tr,
              textEditingController: controller.nameController),
          SizedBox(
            height: 20.h,
          ),
          InputComponent(
              leadingIcon: 'assets/icons/fi-rr-user.svg',
              hintText: 'lastname'.tr,
              textEditingController: controller.nameController),
          SizedBox(
            height: 20.h,
          ),
          InputComponent(
              leadingIcon: 'assets/icons/fi-rr-calendar.svg',
              hintText: 'birthDate'.tr,
              textEditingController: controller.birthDateController),
          SizedBox(
            height: 20.h,
          ),
          InputComponent(
              leadingIcon: 'assets/icons/fi-rr-envelope.svg',
              hintText: 'email'.tr,
              textEditingController: controller.emailController),
          SizedBox(
            height: 20.h,
          ),
          InputComponentPassword(
            hintText: 'password'.tr,
            textEditingController: controller.passwordController,
          ),
          SizedBox(
            height: 20.h,
          ),
          InputComponentPassword(
            hintText: 'confirmPassword'.tr,
            textEditingController: controller.confimPasswordController,
          ),
          SizedBox(
            height: 50.h,
          ),
          button("signup".tr, () {
            Get.to(ConfirmationWidget());
          }),
          SizedBox(
            height: 34.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'you_already_have_account'.tr,
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: medium,
                    color: SecondaryTextColor),
              ),
              Text(
                'login'.tr,
                style: TextStyle(
                    fontSize: 12.sp, fontWeight: semiBold, color: ButtonColor),
              ),
            ],
          )
        ]),
      )),
    );
  }
}
