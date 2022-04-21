import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../data/pallete.data.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

Color grey = Color(0Xff7A7A7A);
Widget SearchBar() => InkWell(
  onTap: (){
        Get.toNamed("/search");
  },
  child:   Container(
    width: double.infinity,
    margin: EdgeInsets.symmetric(horizontal: 3.w,vertical: 1.5.h),
    padding: EdgeInsets.symmetric(vertical: 2.h,horizontal: 5.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50.sp),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          spreadRadius: 2,
          blurRadius: 7,
          offset: Offset(0, 1), // changes position of shadow
        ),
      ],
    ),
    child: IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Search for an event',style: GoogleFonts.poppins(
              fontSize: 10.sp,color: grey
          ),),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: SvgPicture.asset(
                  "assets/icons/search.svg",
                  height: 15.sp,
                  width: 15.sp,
                  color: grey,
                ),
              ),
              VerticalDivider(thickness: 0.2.w,),
              Padding(
                padding:  EdgeInsets.only(left: 2.w),
                child: SvgPicture.asset(
                  "assets/icons/filter.svg",
                  height: 14.sp,
                  width: 14.sp,
                  color: grey,
                ),
              ),
            ],
          )
        ],
      ),
    ),
  ),
);