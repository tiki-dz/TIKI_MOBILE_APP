import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tiki/data/font.data.dart';
import 'package:tiki/data/pallete.data.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:tiki/views/Authentification/components/component.button.dart';

import '../../controllers/confirmation.controller.dart';
import '../../controllers/registration.controller.dart';

class ConfirmationWidget extends StatefulWidget {
  ConfirmationWidget({Key? key}) : super(key: key);

  @override
  State<ConfirmationWidget> createState() => _ConfirmationWidgetState();
}

class _ConfirmationWidgetState extends State<ConfirmationWidget> {
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
                padding: EdgeInsets.only(
                  left: 10.w,
                  right: 10.w,
                  top: 1.h,
                ),
                child: Column(children: [
                  SizedBox(
                    height: 5.h,
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        height: 35.sp,
                        width: 35.sp,
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
                          height: 2.sp,
                          width: 2.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Text(
                    'verification'.tr,
                    style: TextStyle(
                      fontWeight: semiBold,
                      fontSize: 17.sp,
                      color: SecondaryTextColor,
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    "confirmDesc".tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: regular,
                      fontSize: 11.sp,
                      color: SecondaryTextColor,
                    ),
                  ),
                  Text(
                    "hananifatah@gmail.Com",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: regular,
                      fontSize: 11.sp,
                      color: SecondaryTextColor,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'email'.tr + " :",
                      style: TextStyle(
                        fontWeight: medium,
                        fontSize: 12.sp,
                        color: SecondaryTextColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  TextFormField(
                    showCursor: false,
                    readOnly: true,
                    cursorColor: ButtonColor,
                    controller: controller.codePinController,
                    style: TextStyle(fontSize: 12.sp, fontWeight: regular),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 1.0.h, horizontal: 0.0),
                      prefixIcon:
                          Row(mainAxisSize: MainAxisSize.min, children: [
                        SizedBox(
                          width: 5.w,
                        ),
                        SvgPicture.asset(
                          'assets/icons/fi-rr-envelope.svg',
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Container(
                          height: 4.h,
                          width: 0.5.w,
                          color:
                              Color.fromRGBO(112, 112, 112, 1).withOpacity(0.3),
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                      ]),
                      prefixIconConstraints:
                          BoxConstraints(maxHeight: 24.h, maxWidth: 70.w),
                      suffixIconConstraints: BoxConstraints(
                        maxHeight: 12.sp,
                        maxWidth: 10.w,
                      ),
                      suffixIcon: InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Padding(
                              padding: EdgeInsets.only(
                                right: 18.2.w,
                              ),
                              child: SvgPicture.asset(
                                  'assets/icons/fi-rr-pencil.svg'))),
                      filled: true,
                      fillColor: GreyColor,
                      hintText: "email".tr,
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
                    height: 5.h,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'verificationCode'.tr + " :",
                        style: TextStyle(
                          fontWeight: medium,
                          fontSize: 13.sp,
                          color: SecondaryTextColor,
                        ),
                      )),
                  SizedBox(
                    height: 5.h,
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
                      borderRadius: BorderRadius.circular(5.sp),
                      fieldHeight: 34.sp,
                      fieldWidth: 34.sp,
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
                    height: 21.h,
                  ),
                  button('confirm'.tr, () {}),
                  SizedBox(
                    height: 3.h,
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
                            fontSize: 10.sp,
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
                            fontSize: 12.sp,
                            color: SecondaryTextColor,
                          ),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(
                          controller.start.toString() + ' Seconds',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: ButtonColor,
                          ),
                        )
                      ],
                    );
                  }),
                ]))));
  }
}
