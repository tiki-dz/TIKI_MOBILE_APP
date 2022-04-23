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

import '../../constWidgets/progressIndicator.dart';
import '../../controllers/confirmation.controller.dart';
import '../../controllers/registration.controller.dart';

class ConfirmationWidget extends StatefulWidget {
  ConfirmationWidget(
      {Key? key, required this.email, required this.token, required this.cas})
      : super(key: key);
  String email;
  String? token;
  int cas;

  @override
  State<ConfirmationWidget> createState() => _ConfirmationWidgetState();
}

class _ConfirmationWidgetState extends State<ConfirmationWidget> {

  @override
  Widget build(BuildContext context) {
    final controller = Get.put<ConfirmationController>(ConfirmationController(
        email: widget.email, cas: widget.cas, token: widget.token));
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: BackGroundColor,
        body: Padding(
            padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 7.w),
            child: Column(children: [
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      height: 5.h,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
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
                            height: 35.sp,
                            width: 35.sp,
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
                      controller.email,
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
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
                      height: 1.h,
                    ),
                    TextFormField(
                      showCursor: false,
                      readOnly: true,
                      onTap: () {
                        Get.back();
                      },
                      cursorColor: ButtonColor,
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
                            height: 3.h,
                            width: 0.2.w,
                            color: Color.fromRGBO(112, 112, 112, 1)
                                .withOpacity(0.3),
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
                        filled: true,
                        fillColor: GreyColor,
                        hintText: controller.email,
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
                      height: 1.h,
                    ),
                    PinCodeTextField(
                      controller: controller.codePinController,
                      onSubmitted: (s) {},
                      enablePinAutofill: true,
                      autovalidateMode: AutovalidateMode.disabled,
                      appContext: context,
                      length: 6,
                      textStyle: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: medium,
                      ),
                      blinkWhenObscuring: true,
                      animationType: AnimationType.fade,
                      cursorColor: Colors.black,
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      autoFocus: true,
                      keyboardType: TextInputType.number,
                      cursorWidth: 0.4.w,
                      pastedTextStyle: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: medium,
                          color: Colors.white),
                      validator: (v) {},
                      pinTheme: PinTheme(
                        selectedFillColor: Colors.white,
                        selectedColor: GreyColor,
                        activeColor: GreyColor,
                        inactiveColor: GreyColor,
                        activeFillColor: GreyColor,
                        inactiveFillColor: GreyColor,
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5.sp),
                        fieldHeight: 40.sp,
                        fieldWidth: 34.sp,
                      ),
                      onChanged: (value) {},
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Obx(() => controller.isProcessing.value == false
                        ? button("Confirme", () async {
                      await controller.sendCode();
                    })
                        : circularProgressModel()),
                    SizedBox(
                      height: 3.h,
                    ),
                    GetBuilder<ConfirmationController>(builder: (controller) {
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
                      } else {
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
                      }
                    }),
                    SizedBox(height: 2.h)
                  ],
                ),
              ),
            ])));
  }
}
