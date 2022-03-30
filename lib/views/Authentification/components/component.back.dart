import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
Widget backWidget =Align(
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
            color: Colors.black.withOpacity(0.07),
            spreadRadius: 0.1,
            blurRadius: 7,
            offset: Offset(0, 1), // changes position of shadow
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
);