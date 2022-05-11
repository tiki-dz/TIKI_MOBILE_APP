import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../data/pallete.data.dart';

Widget buttonPayer(String title,double price, VoidCallback? function) {
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
        elevation: 4,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp),
              ),
              Text(
                price.toString()+" "+"DA",
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
