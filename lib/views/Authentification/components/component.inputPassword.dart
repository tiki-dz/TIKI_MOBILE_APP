import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import '../../../data/pallete.data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    var regular;
    return Container(
      height: 49.h,
      child: TextFormField(
        showCursor: false,
        obscureText: showPassword,
        cursorColor: ButtonColor,
        controller: widget.textEditingController,
        style: TextStyle(fontSize: 12.sp, height: 4.5.h, fontWeight: regular),
        decoration: InputDecoration(
          prefixIcon: Row(mainAxisSize: MainAxisSize.min, children: [
            SizedBox(
              width: 20.w,
            ),
            SvgPicture.asset("assets/icons/fi-rr-unlock.svg"),
            SizedBox(
              width: 10.w,
            ),
            Container(
              height: 24.h,
              width: 1.w,
              color: Color.fromRGBO(112, 112, 112, 1).withOpacity(0.3),
            ),
            SizedBox(
              width: 10.w,
            ),
          ]),
          prefixIconConstraints:
              BoxConstraints(maxHeight: 24.h, maxWidth: 70.w),
          suffixIconConstraints: BoxConstraints(
            maxHeight: 35.sp,
            maxWidth: 50.w,
          ),
          suffixIcon: InkWell(
            onTap: () {
              setState(() {
                showPassword = !showPassword;
              });
            },
            child: Padding(
                padding: EdgeInsets.only(
                  right: 18.2.w,
                ),
                child: showPassword
                    ? SvgPicture.asset('assets/icons/fi-rr-eye-crossed.svg')
                    : SvgPicture.asset('assets/icons/fi-rr-eye.svg')),
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
      ),
    
    
    );
  }
}
