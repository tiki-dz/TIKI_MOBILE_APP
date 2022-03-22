import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tiki/data/font.data.dart';
import 'package:tiki/data/pallete.data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:tiki/views/Authentification/components/component.button.dart';

import '../../controllers/confirmation.controller.dart';
import '../../controllers/registration.controller.dart';

class forgotPwWidget extends StatefulWidget {
  forgotPwWidget({Key? key}) : super(key: key);

  @override
  State<forgotPwWidget> createState() => _forgotPwWidgetState();
}

class _forgotPwWidgetState extends State<forgotPwWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put<ConfirmatioController>(ConfirmatioController());
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
                    height: 10.h,
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        height: 42.sp,
                        width: 42.sp,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.15),
                              spreadRadius: 0.1,
                              blurRadius: 10,
                              offset:
                                  Offset(0, 1), // changes position of shadow
                            ),
                          ],
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/back.svg',
                          height: 42.sp,
                          width: 42.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Text(
                    'verification'.tr,
                    style: TextStyle(
                      fontWeight: semiBold,
                      fontSize: 27.sp,
                      color: SecondaryTextColor,
                    ),
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  Text(
                    "confirmDesc".tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: regular,
                      fontSize: 12.sp,
                      color: SecondaryTextColor,
                    ),
                  ),
                  Text(
                    "hananifatah@gmail.Com",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: regular,
                      fontSize: 12.sp,
                      color: SecondaryTextColor,
                    ),
                  ),
                  SizedBox(
                    height: 53.h,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'email'.tr + " :",
                      style: TextStyle(
                        fontWeight: medium,
                        fontSize: 15.sp,
                        color: SecondaryTextColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  TextFormField(
                    showCursor: false,
                    readOnly: true,
                    cursorColor: ButtonColor,
                    controller: controller.codePinController,
                    style: TextStyle(fontSize: 12.sp, fontWeight: regular),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 8.0.h, horizontal: 0.0),
                      prefixIcon:
                          Row(mainAxisSize: MainAxisSize.min, children: [
                        SizedBox(
                          width: 20.w,
                        ),
                        SvgPicture.asset(
                          'assets/icons/fi-rr-envelope.svg',
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          height: 24.h,
                          width: 1.w,
                          color:
                              Color.fromRGBO(112, 112, 112, 1).withOpacity(0.3),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                      ]),
                      prefixIconConstraints:
                          BoxConstraints(maxHeight: 24.h, maxWidth: 70.w),
                      filled: true,
                      fillColor: GreyColor,
                      hintText: "hananifatah@gmail.Com",
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: GreyColor),
                        borderRadius: BorderRadius.circular(8.sp),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(8.sp),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(8.sp),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: GreyColor),
                        borderRadius: BorderRadius.circular(8.sp),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 42.h,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'verificationCode'.tr + " :",
                        style: TextStyle(
                          fontWeight: medium,
                          fontSize: 15.sp,
                          color: SecondaryTextColor,
                        ),
                      )),
                  SizedBox(
                    height: 25.h,
                  ),
                  PinCodeTextField(
                    onSubmitted: (s) {},
                    enablePinAutofill: true,
                    autovalidateMode: AutovalidateMode.disabled,
                    appContext: context,
                    length: 5,
                    textStyle: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: medium,
                    ),
                    blinkWhenObscuring: true,
                    animationType: AnimationType.fade,
                    cursorColor: Colors.black,
                    animationDuration: Duration(milliseconds: 300),
                    enableActiveFill: true,
                    autoFocus: true,
                    keyboardType: TextInputType.number,
                    showCursor: false,
                    pastedTextStyle: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: medium,
                        color: Colors.white),
                    validator: (v) {},
                    pinTheme: PinTheme(
                      selectedFillColor: ButtonColor,
                      selectedColor: GreyColor,
                      activeColor: GreyColor,
                      inactiveColor: GreyColor,
                      activeFillColor: GreyColor,
                      inactiveFillColor: GreyColor,
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5.r),
                      fieldHeight: 48.h,
                      fieldWidth: 40.w,
                    ),
                    onCompleted: (v) async {},
                    onChanged: (value) {
                      print(value);
                      setState(() {});
                    },
                    beforeTextPaste: (text) {
                      print("Allowing to paste $text");
                      return true;
                    },
                  ),
                  SizedBox(
                    height: 139.h,
                  ),
                  button('confirm'.tr, () {}),
                  SizedBox(
                    height: 28.h,
                  ),
                  GetBuilder<ConfirmatioController>(builder: (controller) {
                    if (controller.start == 0) {
                      return InkWell(
                        onTap: () {
                          controller.startTimer();
                        },
                        child: Text(
                          'resend'.tr,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: ButtonColor,
                          ),
                        ),
                      );
                    }
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'resendAfter'.tr,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: SecondaryTextColor,
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          controller.start.toString() + ' Seconds',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: ButtonColor,
                          ),
                        )
                      ],
                    );
                  }),
                ]))));
  }
}
