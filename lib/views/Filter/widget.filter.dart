import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:tiki/controllers/SearchController.dart';
import 'package:tiki/data/font.data.dart';
import 'package:tiki/data/pallete.data.dart';
import 'package:get/get.dart';
import '../../Models/model.categoris.dart';
import '../../controllers/filterController.dart';
import '../Authentification/components/component.button.dart';
import '../Home/component/widget.searchBar.dart';
import 'component/component.inputDate.dart';

class FilterWidget extends StatefulWidget {
  FilterWidget({required this.search,Key? key}) : super(key: key);
  String search;

  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  final controller = Get.find<FilterController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

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
                          readOnly:  true,
                          decoration: InputDecoration(
                            hintText: widget.search,
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
                          "cancel".tr,
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
                            padding: EdgeInsets.symmetric(
                                horizontal: 4.w, vertical: 2.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "from".tr,
                                  style: TextStyle(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w500,
                                      color:
                                      const Color(0Xff7A7A7A).withOpacity(0.7)),
                                ),
                                Obx(
                                      () => InputDateComponentFilter(
                                    leadingIcon: 'assets/icons/fi-rr-calendar.svg',
                                    controller: controller,
                                    function: controller.changeFromDate,
                                    hintText: controller.fromDateController.value,
                                    validate: controller.validateFromDate,
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Text(
                                  "to".tr,
                                  style: TextStyle(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w500,
                                      color:
                                      const Color(0Xff7A7A7A).withOpacity(0.7)),
                                ),
                                Obx(
                                      () => InputDateComponentFilter(
                                    leadingIcon: 'assets/icons/fi-rr-calendar.svg',
                                    controller: controller,
                                    function: controller.changeToDate,
                                    hintText: controller.toDateController.value,
                                    validate: controller.validateToDate,
                                  ),
                                ),
                                SizedBox(
                                  height: 4.h,
                                ),
                                Text(
                                  "price".tr,
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                                GetBuilder(
                                    init: controller,
                                    builder: (context) {
                                      return Column(
                                        children: [
                                          RangeSlider(
                                            divisions: 50,
                                            activeColor: KOrange,
                                            inactiveColor:
                                            Colors.grey.withOpacity(0.2),
                                            values: controller.values,
                                            onChanged: controller.changeSliderValue,
                                            min: 0,
                                            max: 5000,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5.w),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  controller.values.start
                                                      .toStringAsFixed(0) ==
                                                      "0"
                                                      ? "free".tr
                                                      : controller.values.start
                                                      .toStringAsFixed(0) +
                                                      " Da",
                                                  style: TextStyle(
                                                      fontSize: 13.sp,
                                                      color: Colors.black,
                                                      fontWeight: medium),
                                                ),
                                                Text(
                                                  controller.values.end
                                                      .toStringAsFixed(0) +
                                                      " Da",
                                                  style: TextStyle(
                                                      fontSize: 13.sp,
                                                      color: Colors.black,
                                                      fontWeight: medium),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      );
                                    }),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Text(
                                  "catégories".tr,
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                GetBuilder(
                                    init: controller,
                                    builder: (context) {
                                      return Container(
                                        padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                        decoration: BoxDecoration(
                                            color: GreyColor,
                                            borderRadius:
                                            BorderRadius.circular(7.sp)),
                                        width: double.infinity,
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton<CategoryModel>(
                                            value: controller.category,
                                            icon: const Icon(Icons.keyboard_arrow_down_rounded),
                                            elevation: 16,
                                            style: const TextStyle(
                                                color: Colors.black),
                                            onChanged: controller.updateCategory,
                                            items: controller.categories
                                                .map((CategoryModel value) {
                                              return DropdownMenuItem<
                                                  CategoryModel>(
                                                value: value,
                                                child: Text(
                                                  value.name,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 13.sp),
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      );
                                    }),
                              ],
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 2.h, horizontal: 3.w),
                              child: button("show_result".tr, () {
                                controller.filter();
                              }),
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
