import 'package:flutter/material.dart';
import '../../data/pallete.data.dart';
import 'package:sizer/sizer.dart';


Widget circularProgressModel([Color color = KOrange,double height=7 ] ) => SizedBox(
    height: height.h,
    width: height.h,
    child: Center(
      child: CircularProgressIndicator(
          color: color),
    ));

Widget paginationModel() => Container(
    margin: EdgeInsets.symmetric(vertical: 3.h),
    child: Text(
      "more",
      style: TextStyle(
          color: KOrange, fontSize: 13.sp, fontWeight: FontWeight.w600),
    ));