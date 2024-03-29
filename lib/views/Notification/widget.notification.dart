import 'package:flutter/material.dart';
import 'package:tiki/controllers/notificationsController.dart';
import 'package:tiki/data/font.data.dart';
import 'package:sizer/sizer.dart';
import 'package:tiki/data/pallete.data.dart';
import 'package:get/get.dart';
import '../../constWidgets/noItem.dart';
import '../../constWidgets/progressIndicator.dart';
import 'component/component.NotificationModel.dart';
import 'component/component.switch.dart';

class NotificationsWidget extends StatefulWidget {
  const NotificationsWidget({Key? key}) : super(key: key);

  @override
  _NotificationsWidgetState createState() => _NotificationsWidgetState();
}

class _NotificationsWidgetState extends State<NotificationsWidget> {
  var controller = Get.put(NotificationsController());

  @override
  void initState() {
    controller.getNotifications();
    // TODO: implement initState
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: [
          SizedBox(
            height: 2.h,
          ),
          Container(
              padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
              margin: EdgeInsets.symmetric(horizontal: 19.w),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: Offset(0, 4), // changes position of shadow
                ),
              ], color: greyColor, borderRadius: BorderRadius.circular(20.sp)),
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
          Expanded(
            child: GetBuilder(
                init: controller,
                builder: (context) {
                  return controller.fetchingNotification
                      ? circularProgressModel()
                      : controller.currentLength() == 0
                      ? noItemWidgetModel()
                      : ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    itemCount: controller.currentLength(),
                    itemBuilder: (context, index) =>
                        notificationWidgetModel(
                            controller.currentNotification(index)),
                  );
                }),
          )
        ],
      ),
    );
  }
}
