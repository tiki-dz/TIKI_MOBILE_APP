import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import '../../../data/font.data.dart';
import '../../../data/pallete.data.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class InputComponentPassword extends StatefulWidget {
  String hintText;
  TextEditingController textEditingController;

  InputComponentPassword(
      {required this.textEditingController, required this.hintText});

  @override
  State<InputComponentPassword> createState() => _InputComponentPasswordState();
}

class _InputComponentPasswordState extends State<InputComponentPassword> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: !showPassword,
      cursorColor: ButtonColor,
      controller: widget.textEditingController,
      style: TextStyle(fontSize: 10.sp, fontWeight: regular),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 1.0.h, horizontal: 0.0),
        prefixIcon: Row(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(
            width: 5.w,
          ),
          SvgPicture.asset("assets/icons/fi-rr-unlock.svg"),
          SizedBox(
            width: 5.w,
          ),
          Container(
            height: 3.h,
            width: 0.2.w,
            color: Color.fromRGBO(112, 112, 112, 1).withOpacity(0.3),
          ),
          SizedBox(
            width: 3.w,
          ),
        ]),
        prefixIconConstraints: BoxConstraints(maxHeight: 24.h, maxWidth: 70.w),
        suffixIconConstraints: BoxConstraints(
          maxHeight: 12.sp,
          maxWidth: 10.w,
        ),
        suffixIcon: InkWell(
          onTap: () {
            setState(() {
              showPassword = !showPassword;
            });
          },
          child: Padding(
              padding: EdgeInsets.only(
                right: 4.2.w,
              ),
              child: !showPassword
                  ? SvgPicture.asset(
                      'assets/icons/fi-rr-eye-crossed.svg',
                      height: 8.sp,
                      width: 8.sp,
                    )
                  : SvgPicture.asset(
                      'assets/icons/fi-rr-eye.svg',
                      height: 8.sp,
                      width: 8.sp,
                    )),
        ),
        filled: true,
        fillColor: GreyColor,
        hintText: widget.hintText,
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
    );
  }
}
