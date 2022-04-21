import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import '../../../controllers/ticketsController.dart';
import '../../../data/pallete.data.dart';

// 0= Next ,  Historique=1
Widget animatedContainerModel(String title, int cas, int selected) {
  bool same = selected == cas;
  return InkWell(
    onTap:(){
      var controller =Get.find<TicketsController>();
      controller.updateSelected(cas);
    } ,
    child: AnimatedContainer(
      decoration: BoxDecoration(
          color: same ? KOrange : greyColor,
          borderRadius: BorderRadius.circular(19.sp)),
      padding: EdgeInsets.symmetric(vertical: 1.h),
      duration: const Duration(milliseconds: 300),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
              color: same ? Colors.white : Colors.black,
              fontSize: 9.sp),
        ),
      ),
    ),
  );
}
