import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:tiki/data/font.data.dart';
Widget priceDesc(String title,String price){
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 0.8.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: TextStyle(color: const Color(0xff707070),fontSize: 12.sp),),
        Text(price,style: TextStyle(color: Colors.black,fontSize: 11.sp,fontWeight: medium),)
      ],
    ),
  );
}