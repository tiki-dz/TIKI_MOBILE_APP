import 'package:flutter/material.dart';
import 'package:tiki/data/font.data.dart';
import 'package:tiki/data/pallete.data.dart';
import 'package:tiki/views/Authentification/components/component.button.dart';
import 'package:tiki/views/Authentification/components/component.input.dart';
import "package:flutter_svg/flutter_svg.dart";
import 'package:get/get.dart';
import 'package:tiki/views/Authentification/widget.confirmation.dart';
import 'package:sizer/sizer.dart';
import 'package:tiki/views/Authentification/widget.login.dart';
import '../../constWidgets/progressIndicator.dart';
import '../../controllers/registration.controller.dart';
import '../ButtomBar/widget.bottomBar.dart';
import 'components/component.inputDate.dart';
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
        padding: EdgeInsets.only(
          left: 10.w,
          right: 10.w,
          top: 7.h,
        ),
        child: Form(
          key: controller.formKey,
          child: Column(children: [
            SizedBox(
              height: 1.h,
            ),
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
            SizedBox(
              height: 3.h,
            ),
            Text(
              'signup'.tr,
              style: TextStyle(
                fontSize: 27.sp,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            InputComponent(
                leadingIcon: 'assets/icons/fi-rr-user.svg',
                hintText: 'name'.tr,
                textEditingController: controller.nameController,validate: controller.validateName,),
            SizedBox(
              height: 2.h,
            ),
            InputComponent(
                leadingIcon: 'assets/icons/fi-rr-user.svg',
                hintText: 'lastname'.tr,
                textEditingController: controller.lastNameController,validate:  controller.validateLastName,),
            SizedBox(
              height: 2.h,
            ),
            Obx(
              () => InputDateComponent(
                leadingIcon: 'assets/icons/fi-rr-calendar.svg',
                hintText: controller.birthDateController.value == ""
                    ? 'birthDate'.tr
                    : controller.birthDateController.value,
                controller: controller,
                function: controller.changeDate,
                validate: controller.validateDate,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            InputComponent(
                leadingIcon: 'assets/icons/fi-rr-envelope.svg',
                hintText: 'email'.tr,
                textEditingController: controller.emailController,validate: controller.validateEmail,),
            SizedBox(
              height: 2.h,
            ),
            InputComponentPassword(
              hintText: 'password'.tr,
              textEditingController: controller.passwordController,
              validate: controller.validatePassword,
            ),
            SizedBox(
              height: 2.h,
            ),
            InputComponentPassword(
              hintText: 'confirmPassword'.tr,
              textEditingController: controller.confirmPasswordController,
              validate: controller.validateConfirmPassword,
            ),
            SizedBox(
              height: 7.h,
            ),
            Obx(() => controller.isUpdating.value == false
                ? button("Sign up", () async {
                    await controller.signUp();
                  })
                : circularProgressModel()),
            SizedBox(
              height: 3.h,
            ),
            InkWell(
              onTap: () {
                Get.to(() =>LogInWidget());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'you_already_have_account'.tr,
                    style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: medium,
                        color: SecondaryTextColor),
                  ),
                  Text(
                    'login'.tr,
                    style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: semiBold,
                        color: ButtonColor),
                  ),
                ],
              ),
            )
          ]),
        ),
      )),
    );
  }
}
