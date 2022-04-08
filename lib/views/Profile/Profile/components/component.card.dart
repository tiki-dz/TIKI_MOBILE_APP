import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../data/pallete.data.dart';

Widget myContainer(String title, String icon) => Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(7.sp),
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.2),
        spreadRadius: 1,
        blurRadius: 5,
        offset: Offset(0, 1), // changes position of shadow
      ),
    ],
  ),
  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.5.h),
  child: Row(
    children: [
      SvgPicture.asset('assets/icons/$icon.svg',color: KOrange,),
      SizedBox(
        width: 4.w,
      ),
      Text(
        title,
        style: TextStyle(color: KOrange),
      )
    ],
  ),
);