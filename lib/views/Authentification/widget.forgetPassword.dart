import 'package:flutter/material.dart';
import 'package:tiki/data/font.data.dart';
import 'package:tiki/data/pallete.data.dart';
import 'package:tiki/views/Authentification/components/component.button.dart';
import 'package:tiki/views/Authentification/components/component.input.dart';
import "package:flutter_svg/flutter_svg.dart";
import 'package:get/get.dart';
import 'package:tiki/views/Authentification/widget.confirmation.dart';
import 'package:sizer/sizer.dart';
import '../../controllers/registration.controller.dart';
import 'components/component.inputPassword.dart';
import '../../data/font.data.dart';
import '../../data/pallete.data.dart';
import 'package:google_fonts/google_fonts.dart';

class forgetPasswordWidget extends StatefulWidget {
  const forgetPasswordWidget({Key? key}) : super(key: key);

  @override
  _forgetPasswordWidgetState createState() => _forgetPasswordWidgetState();
}

class _forgetPasswordWidgetState extends State<forgetPasswordWidget> {
  final controller = Get.put(SignUpController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
     child: Scaffold(
        backgroundColor: BackGroundColor,
        body: SingleChildScrollView(
            child: Padding(
            padding: EdgeInsets.only(
              left: 10.w,
              right: 10.w,
              top: 7.h,
            ),
            child: Column(children: [
              SizedBox(
                height: 3.h,
              ),
              Align(
                alignment: Alignment.topRight,
                child: SvgPicture.asset('assets/icons/fi-rr-cross-small.svg'),
              ),
              SizedBox(
                height: 3.h,
              ),
              Text(
                'Enter new password'.tr,
                style: TextStyle(
                  fontSize: 27.sp,
                  fontWeight: semiBold,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              InputComponentPassword(
                hintText: 'password'.tr,
                textEditingController: controller.passwordController,
              ),
              SizedBox(
                height: 2.h,
              ),
              InputComponentPassword(
                hintText: 'newpassword'.tr,
                textEditingController: controller.passwordController,
              ),
              SizedBox(
                height: 2.h,
              ),
              button("Confirmer".tr, () {
                //should be login widget here
                Get.to(ConfirmationWidget());
              })
              

            ])
          )
  
        )
      )
    );
  }
}