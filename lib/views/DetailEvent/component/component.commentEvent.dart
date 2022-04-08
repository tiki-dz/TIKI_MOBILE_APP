import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
Widget commentModelEvent()=> Align(
  widthFactor: 0.6,
  alignment: Alignment.centerLeft,
  child: Container(
    width: 30.sp,
    height:30.sp ,
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
            color: Colors.white, width: 2.sp),
        image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(
                "https://www.nabeulvoyages.com//medias/g_custom_v1519627962_vltlogy23k1iid9pjffx.jpg"))),
  ),
);