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