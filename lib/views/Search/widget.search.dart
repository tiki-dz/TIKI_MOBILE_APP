import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:tiki/controllers/SearchController.dart';
import 'package:tiki/data/font.data.dart';
import 'package:tiki/data/pallete.data.dart';
import 'package:get/get.dart';
import 'package:tiki/views/Search/widget.eventModeSearch.dart';
import '../../constWidgets/progressIndicator.dart';
import '../Home/component/widget.eventMode.dart';
import '../Home/component/widget.searchBar.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchController());
    return SafeArea(
        child: Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed("/filter");
        },
        backgroundColor: ButtonColor,
        child: SvgPicture.asset(
          "assets/icons/filter.svg",
          color: Colors.white,
          height: 17.sp,
        ),
      ),
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
                      onSubmitted: controller.onSubmit,
                      focusNode: controller.focusNode,
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
                  child: Column(
                    children: [
                      SizedBox(height: 1.h,),
                      Expanded(
                        child: GetBuilder(
                            init: controller,
                            builder: (context) {
                              return controller.isFetching
                                  ? circularProgressModel()
                                  : controller.events.isNotEmpty
                                      ? ListView.builder(
                                          itemCount: controller.events.length,
                                          itemBuilder:
                                              (BuildContext context, int index) {
                                            return Column(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.symmetric(vertical: 2.h),
                                                  child: eventModelSearch(controller.events[index]),
                                                ),
                                                index == controller.events.length - 1
                                                    ? Column(
                                                        children: [
                                                          if (controller.haveNext)
                                                            !controller.isFetchingPage
                                                                ? InkWell(
                                                                    onTap: () async {
                                                                      await controller
                                                                          .getEvents();
                                                                    },
                                                                    child:
                                                                        pagination(),
                                                                  )
                                                                : Padding(
                                                                    padding: EdgeInsets
                                                                        .symmetric(
                                                                            vertical:
                                                                                2.h),
                                                                    child:
                                                                        const CircularProgressIndicator(),
                                                                  )
                                                          else
                                                            const SizedBox(),
                                                        ],
                                                      )
                                                    : const SizedBox(),
                                              ],
                                            );
                                          })
                                      : ListView(
                                          children: [
                                            SizedBox(height: 25.h),
                                            Center(child: Text("no_result".tr))
                                          ],
                                        );
                            }),
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    ));
  }
}
