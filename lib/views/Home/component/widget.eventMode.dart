import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tiki/data/font.data.dart';

import '../../../data/pallete.data.dart';

Widget eventModel() => Container(
      height: 27.h,
      width: 70.w,
      margin: EdgeInsets.only(right: 5.w),
      decoration: BoxDecoration(
        image: const DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(
              "https://horreurqc.b-cdn.net/wp-content/uploads/2019/11/MV5BNDM2NTBiOWYtN2E3Mi00MDdjLTk2MjMtZjlmMWE2N2QxNjdjXkEyXkFqcGdeQXVyNjg2NjQwMDQ@._V1_SY1000_CR0014991000_AL_-1155x770.jpg",
            )),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(7.sp),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                  child: Container(
                color: Colors.transparent,
              )),
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(7.sp),
                          bottomRight: Radius.circular(7.sp))),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 1.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Knives out",
                                  style: TextStyle(
                                      fontWeight: semiBold, fontSize: 13.sp),
                                ),
                                Text(
                                  "Oran ,7:30 pm",
                                  style: GoogleFonts.poppins(
                                      fontWeight: medium,
                                      fontSize: 9.sp,
                                      color: Color(0xffD6ABAB)),
                                )
                              ],
                            ),
                            Text(
                              "1200 DA",
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: semiBold,
                                  color: Orange),
                            )
                          ],
                        ),
                      ],
                    ),
                  )),
            ],
          ),
          Positioned(
              bottom: 8.5.h,
              left: 6.w,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.sp),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
                height: 35.sp,
                width: 35.sp,
                child: Padding(
                  padding:  EdgeInsets.symmetric(vertical: 1.h,horizontal: 3.w),
                  child: const FittedBox(
                    fit: BoxFit.fill,
                    child: Text(
                  "08\nJAN",
                  style: TextStyle(fontWeight: semiBold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
