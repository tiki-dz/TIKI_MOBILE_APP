import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../data/pallete.data.dart';

Widget button(String title, VoidCallback? function) {
  return SizedBox(
    width: double.infinity,
    height: 57.h,
    child: InkWell(
      onTap: function,
      child: Card(
        margin: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(6.sp),
          ),
        ),
        color: ButtonColor,
        elevation: 4,
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 15.sp),
          ),
        ),
      ),
    ),
  );
}
