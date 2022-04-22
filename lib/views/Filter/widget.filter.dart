import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:tiki/controllers/SearchController.dart';
import 'package:tiki/data/font.data.dart';
import 'package:tiki/data/pallete.data.dart';
import 'package:get/get.dart';
import '../../controllers/filterController.dart';
import '../Authentification/components/component.button.dart';
import '../Home/component/widget.searchBar.dart';
import 'component/component.inputDate.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({Key? key}) : super(key: key);

  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FilterController());
    return SafeArea(
        child: Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        decoration: BoxDecoration(gradient: linear),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        suffixIcon: Padding(
                          padding: EdgeInsets.all(11.sp),
                          child: SvgPicture.asset(
                            "assets/icons/search.svg",
                            color: grey,
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 6.w),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.sp),
                            borderSide:
                                BorderSide(color: KOrange, width: 1.sp)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.sp),
                            borderSide: BorderSide(
                                color: Color(0xffBDBDBD), width: 0.5.sp)),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),
                  SizedBox(width: 4.w),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: medium),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12.sp),
                        topLeft: Radius.circular(12.sp)),
                    color: Colors.white),
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "From",
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0Xff7A7A7A).withOpacity(0.7)),
                            ),
                            Obx(
                              () => InputDateComponentFilter(
                                leadingIcon: 'assets/icons/fi-rr-calendar.svg',
                                controller: controller,
                                function: controller.changeFromDate,
                                hint: controller.fromDate.value,
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "To",
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0Xff7A7A7A).withOpacity(0.7)),
                            ),
                            Obx(
                              () => InputDateComponentFilter(
                                leadingIcon: 'assets/icons/fi-rr-calendar.svg',
                                controller: controller,
                                function: controller.changeToDate,
                                hint: controller.toDate.value,
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "Price",
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                            GetBuilder(
                              init: controller,
                              builder: (context) {
                                return RangeSlider(
                                  activeColor: KOrange,
                                  inactiveColor: Colors.grey.withOpacity(0.2),
                                  values: controller.values,
                                  onChanged: controller.changeSliderValue,
                                  min: 100,
                                  max: 2000,
                                );
                              }
                            )
                          ],
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 2.h,horizontal: 3.w),
                          child: button("Show result",(){}),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
