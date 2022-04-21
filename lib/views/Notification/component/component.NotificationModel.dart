import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:tiki/data/pallete.data.dart';

Widget notificationModel() => Container(
    margin: EdgeInsets.symmetric(vertical: 1.h),
    padding: EdgeInsets.symmetric(vertical: 1.h),
    decoration: BoxDecoration(
        color: greyColor, borderRadius: BorderRadius.circular(6.sp)),
    child: Column(
      children: [
        ListTile(
          leading: SvgPicture.asset("assets/icons/speaker.svg"),
          title: Text(
            "une remise de 50% sur le ticket du film knives out ",
            style: TextStyle(fontSize: 10.sp),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Text("22 min ago",
                style: TextStyle(
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFA1A1A1))),
          ),
        )
      ],
    ));