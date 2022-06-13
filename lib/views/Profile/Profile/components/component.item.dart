import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';


Widget listTileModelWidget(String title, String icon, function) => Padding(
  padding: EdgeInsets.symmetric(vertical: 0.5.h),
  child: ListTile(
    onTap: function,
    leading: Container(
      width: 35.sp,
      height: 35.sp,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.sp),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      padding: EdgeInsets.all(11.sp),
      child: SvgPicture.asset(
        "assets/icons/$icon.svg",
        height: 20,
        width: 20,
        color: Colors.black,
      ),
    ),
    title: Padding(
      padding: EdgeInsets.only(left: 10),
      child: Text(
        title,
        style: GoogleFonts.poppins(
            fontSize: 11.sp,
            color: Colors.black,
            fontWeight: FontWeight.w500),
      ),
    ),
    trailing: Icon(
      Icons.arrow_forward_ios_rounded,
      color: Colors.black,
      size: 12.sp,
    ),
  ),
);