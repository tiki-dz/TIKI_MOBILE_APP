import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:tiki/controllers/purchaseController.dart';

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
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cG9ydHJhaXQlMjBtYW58ZW58MHx8MHx8&w=1000&q=80"),
                  fit: BoxFit.fill),
              shape: BoxShape.circle),
        ),
      ),
      Text(
       "f.ali",style: TextStyle(fontSize: 8.sp),),
    ],
  );
}
