import 'package:flutter/material.dart';
import 'package:tiki/controllers/notificationsController.dart';
import 'package:tiki/data/font.data.dart';
import 'package:sizer/sizer.dart';
import 'package:tiki/data/pallete.data.dart';
import 'package:get/get.dart';
import 'component/component.NotificationModel.dart';
import 'component/component.switch.dart';

class NotificationsWidget extends StatefulWidget {
  const NotificationsWidget({Key? key}) : super(key: key);

  @override
  _NotificationsWidgetState createState() => _NotificationsWidgetState();
}

class _NotificationsWidgetState extends State<NotificationsWidget> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotificationsController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "notifications".tr,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 16.sp),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Column(
          children: [
            SizedBox(
              height: 2.h,
            ),
            Container(
                padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
                margin: EdgeInsets.symmetric(horizontal: 19.w),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset: Offset(0, 4), // changes position of shadow
                      ),
                    ],
                    color: greyColor,
                    borderRadius: BorderRadius.circular(20.sp)),
                child: Obx(
                  () => Row(
                    children: [
                      Expanded(
                          child: animatedContainerModel(
                              "all".tr, 0, controller.selected.value)),
                      SizedBox(
                        width: 1.w,
                      ),
                      Expanded(
                          child: animatedContainerModel(
                              "for_you".tr, 1, controller.selected.value))
                    ],
                  ),
                )),
            SizedBox(
              height: 4.h,
            ),
            Expanded(
                child: ListView.builder(itemCount: 3,
              itemBuilder: (context, index) => notificationModel(),
            ))
          ],
        ),
      ),
    );
  }
}
