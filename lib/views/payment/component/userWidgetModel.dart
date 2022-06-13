import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:tiki/controllers/purchaseController.dart';

import '../../Profile/Profile/components/componentPicWidget.dart';

Widget userModelWidget() {
  final controller = Get.find<PurchaseController>();

  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(right: 2.w),
        padding: EdgeInsets.all(10.sp),
        height: 60.sp,
        width: 60.sp,
        decoration: BoxDecoration(
            color: const Color(0xffF5F5F5),
            borderRadius: BorderRadius.circular(8.sp)),
        child: picWidgetModel(controller.userProfile.picture)
      ),
      Text(
       controller.giveName(),style: TextStyle(fontSize: 8.sp),),
    ],
  );
}
