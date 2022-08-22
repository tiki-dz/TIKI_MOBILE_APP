import 'package:flutter/material.dart';
import 'package:tiki/data/pallete.data.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
Widget categoryWidgetModel(bool selected,String title) {
  return AnimatedContainer(
    padding: EdgeInsets.symmetric(horizontal: 4.w,vertical:1.h ),
    decoration: BoxDecoration(
      border: Border.all(color: KOrange),
      color: selected ? KOrange : Colors.white,
      borderRadius: BorderRadius.circular(20.sp),
    ),
    duration: const Duration(milliseconds: 300),
    child: Center(child: Text(title,style: TextStyle(fontSize: 10.sp,color: selected ? Colors.white : KOrange),)),
  );
}