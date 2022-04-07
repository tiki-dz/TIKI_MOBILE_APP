import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../data/pallete.data.dart';

Widget buttonEvent(String title,String icon ,VoidCallback? function) {
  return SizedBox(
    width: double.infinity,
    height: 45.sp,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/icons/$icon.svg',width: 13.sp,height: 13.sp,),
            SizedBox(width: 5.w,),
            Text(
              title,
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 12.sp),
            ),
          ],
        ),
      ),
    ),
  );
}