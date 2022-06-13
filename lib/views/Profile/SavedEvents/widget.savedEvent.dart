import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiki/controllers/savedEventController.dart';
import 'package:tiki/views/Profile/SavedEvents/widget.eventSavedModel.dart';

import '../../../data/font.data.dart';
import '../../../data/pallete.data.dart';
import 'package:sizer/sizer.dart';

class SavedEventsWidget extends StatefulWidget {
  const SavedEventsWidget({Key? key}) : super(key: key);

  @override
  _SavedEventsWidgetState createState() => _SavedEventsWidgetState();
}

class _SavedEventsWidgetState extends State<SavedEventsWidget> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SavedEventController());
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: KOrange,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "saved_events".tr,
          style: TextStyle(fontSize: 15.sp, fontWeight: medium),
        ),
      ),
      body: Container(
        height: 100.h,
        width: 100.w,
        color: KOrange,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12.sp),
                  topLeft: Radius.circular(12.sp)),
              color: Colors.white),
          child: GetBuilder(
              init: controller,
              builder: (context) {
                return controller.events.isEmpty
                    ? const Center(
                        child: Text("there are no items"),
                      )
                    : ListView.separated(
                        padding: EdgeInsets.symmetric(
                            vertical: 2.h, horizontal: 3.w),
                        itemCount: controller.events.length,
                        itemBuilder: (context, index) {
                          return eventSavedModel(controller.events[index]);
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 2.h,
                          );
                        },
                      );
              }),
        ),
      ),
    ));
  }
}
