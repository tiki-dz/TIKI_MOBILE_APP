import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tiki/Models/model.event.dart';
import 'package:tiki/data/font.data.dart';
import 'package:tiki/views/DetailEvent/widget.eventDetail.dart';

import '../../../constWidgets/cashedNetwork.dart';
import '../../../data/const.dart';
import '../../../data/pallete.data.dart';
import 'package:get/get.dart';



Widget eventSavedModel(EventModel event) {
  return InkWell(
    onTap: () {
      Get.to(() => EventDetailWidget(event: event));
    },
    child: Container(
      height: 30.h,
      width: 90.w,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 1), // changes position of shadow
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
                  width: 90.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7.sp),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(7.sp),
                      child: cachedNetworkModel(event.eventImage)),
                ),
              ),
              SizedBox(
                height: 7.h,
              )
            ],
          ),
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
                                  event.nameHome() ,
                                  style: TextStyle(
                                      fontWeight: semiBold, fontSize: 13.sp),
                                ),
                                Text(
                                  "${event.address},7:30 pm",
                                  style: GoogleFonts.poppins(
                                      fontWeight: medium,
                                      fontSize: 9.sp,
                                      color: Color(0xffD6ABAB)),
                                )
                              ],
                            ),
                            Text(
                              "${event.price} DA",
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: semiBold,
                                  color: KOrange),
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
                  padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Text(
                      "${event.startDate.day}\n${monthsAn[event.startDate.month ]}",
                      style: const TextStyle(fontWeight: semiBold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ))
        ],
      ),
    ),
  );
}
