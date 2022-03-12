import 'package:flutter/material.dart';
import '../../../data/pallete.data.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';


// modifier hna ya fouad
InputDecoration normalInput(String hint, String icon){
  return InputDecoration(

    prefixIcon:SvgPicture.asset(
      icon,
      height: 15.sp,
      width: 15.sp,
    ) ,
    hintText: hint,
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.white, width: 7.sp)),
    enabledBorder:OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.white, width:7.sp)) ,
    fillColor: GreyColor,
    filled: true,
  );

}