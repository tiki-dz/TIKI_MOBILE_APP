import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../data/pallete.data.dart';

Widget button(String title, VoidCallback? function) {
  return SizedBox(
    width: double.infinity,
    height: 50.sp,
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
        elevation: 0,
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
