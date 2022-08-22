import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiki/controllers/detailEventController.dart';
import '../../../data/pallete.data.dart';

Widget buttonSaveEvent() {
  final controller = Get.find<DetailEventController>();
  return SizedBox(
    height: 45.sp,
    width: 45.sp,
    child: InkWell(
      onTap: (){
        controller.saveUnSaveEvent();
      },
      child: Card(
          margin: const EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(6.sp),
            ),
          ),
          color: Colors.white,
          elevation: 2,
          child: Padding(
            padding:EdgeInsets.all(14.sp),
            child: Obx(()=>SvgPicture.asset('assets/icons/${controller.icon}.svg',width: 13.sp,height: 13.sp),
            ),)
      ),
    ),
  );
}