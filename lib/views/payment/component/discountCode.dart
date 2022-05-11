import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiki/controllers/purchaseController.dart';
import '../../../data/font.data.dart';
import '../../../data/pallete.data.dart';
import 'package:sizer/sizer.dart';
class InputDiscountCode extends StatelessWidget {

  String hintText;
  TextEditingController textEditingController;
  String? Function(String?) submit;

  InputDiscountCode(
      {
        required this.textEditingController,
        required this.hintText,required this.submit});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PurchaseController>();
    return TextField(
      onSubmitted: submit,
      cursorColor: ButtonColor,
      controller: textEditingController,
      style: TextStyle(fontSize: 10.sp, fontWeight: regular),
      decoration: InputDecoration(
        suffixIcon: controller.enableDiscountCode ? InkWell(
          onTap: () {
            controller.deleteDiscountCode();

          },
          child: Icon(
            Icons.clear_rounded,size: 14.sp,color: Colors.black,
          ),
        ) :const SizedBox(),
        contentPadding: EdgeInsets.symmetric( horizontal: 2.w),
        filled: true,
        fillColor: GreyColor,
        hintText: hintText,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.sp),
            borderSide: BorderSide(color: KOrange, width: 1.sp)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.sp),
            borderSide: BorderSide(color: Color(0xffBDBDBD), width: 0.5.sp)),
      ),
    );
  }
}