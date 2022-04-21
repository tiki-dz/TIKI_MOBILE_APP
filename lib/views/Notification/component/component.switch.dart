import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tiki/controllers/notificationsController.dart';
import '../../../data/pallete.data.dart';
import 'package:get/get.dart';
// all = 0 , for you = 1
Widget animatedContainerModel(String title, int cas, int selected) =>
    InkWell(
      onTap:(){
        var controller =Get.find<NotificationsController>();
        controller.updateSelected(cas);
      } ,
      child: AnimatedContainer(
        decoration: BoxDecoration(
            color: selected == cas ? KOrange : greyColor,
            borderRadius: BorderRadius.circular(19.sp)),
        padding: EdgeInsets.symmetric(vertical: 1.h),
        duration: const Duration(milliseconds: 300),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                color: selected == cas ? Colors.white : Colors.black,
                fontSize: 9.sp),
          ),
        ),
      ),
    );
