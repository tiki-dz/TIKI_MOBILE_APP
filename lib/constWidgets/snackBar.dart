import 'package:flutter/material.dart';
import 'package:tiki/data/font.data.dart';
import '../../data/pallete.data.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

void snackBarModel(String title,String message, bool isError) {
  Get.snackbar(
    title,
    message,
    titleText: Text(title,style: TextStyle(fontSize: 14.sp,color: Colors.white,fontWeight: semiBold),),
    messageText:  Text(message,style: TextStyle(fontSize: 9.sp,color: Colors.white,fontWeight: regular),),
    padding: EdgeInsets.symmetric(vertical: 2.h,horizontal: 10.w),
    margin: EdgeInsets.all(15.sp),
    isDismissible: true,
    dismissDirection: DismissDirection.horizontal,
    colorText: Colors.white,
    backgroundColor:  isError ? Colors.red : Colors.green,
    icon: Icon(Icons.warning, color: Colors.white),
    snackPosition: SnackPosition.BOTTOM,
  );
}