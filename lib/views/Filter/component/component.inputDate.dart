import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../data/font.data.dart';
import '../../../data/pallete.data.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class InputDateComponentFilter extends StatefulWidget {
  String leadingIcon;
  var controller;
  String hintText;

  String? Function(String?) validate;
  Function(DateTime) function;

  InputDateComponentFilter(
      {Key? key,
      required this.hintText,
      required this.validate,
      required this.leadingIcon,
      required this.controller,
      required this.function})
      : super(key: key);

  @override
  State<InputDateComponentFilter> createState() =>
      _InputDateComponentFilterState();
}

class _InputDateComponentFilterState extends State<InputDateComponentFilter> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: () {
        Get.bottomSheet(Container(
            height: 40.h,
            color: Colors.white,
            child: Column(
              children: [
                Expanded(
                  child: CupertinoDatePicker(
                    maximumYear: DateTime.now()
                        .add(const Duration(days: 2190))
                        .year,
                    initialDateTime:
                          DateTime.now().add(const Duration(days: 1)),
                    minimumDate: DateTime.now(),
                    mode: CupertinoDatePickerMode.date,
                    onDateTimeChanged: widget.function,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.h),
                  child: TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        "save".tr,
                        style: TextStyle(
                            fontWeight: medium,
                            fontSize: 13.sp,
                            color: KOrange),
                      )),
                )
              ],
            )));
      },
      readOnly: true,
      cursorColor: ButtonColor,
      style: TextStyle(fontSize: 10.sp, fontWeight: regular),
      decoration: InputDecoration(
        hintText: widget.hintText,
        contentPadding: EdgeInsets.symmetric(vertical: 0.05.h, horizontal: 0.0),
        prefixIcon: Row(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(
            width: 5.w,
          ),
          SvgPicture.asset(widget.leadingIcon),
          SizedBox(
            width: 5.w,
          ),
          Container(
            height: 3.h,
            width: 0.2.w,
            color: const Color.fromRGBO(112, 112, 112, 1).withOpacity(0.3),
          ),
          SizedBox(
            width: 3.w,
          ),
        ]),
        prefixIconConstraints: BoxConstraints(maxHeight: 24.h, maxWidth: 70.w),
        suffixIconConstraints: BoxConstraints(
          maxHeight: 12.sp,
          maxWidth: 50.w,
        ),
        filled: true,
        fillColor: GreyColor,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: GreyColor),
          borderRadius: BorderRadius.circular(8.sp),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(8.sp),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(8.sp),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: GreyColor),
          borderRadius: BorderRadius.circular(8.sp),
        ),
      ),
    );
  }
}
