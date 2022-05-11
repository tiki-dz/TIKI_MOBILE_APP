import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tiki/controllers/ticketsController.dart';
import 'package:tiki/views/Tickets/component/component.switch.dart';
import 'package:get/get.dart';
import '../../data/pallete.data.dart';
import 'component/component.carousel.dart';

class TicketsWidget extends StatefulWidget {
  const TicketsWidget({Key? key}) : super(key: key);

  @override
  _TicketsWidgetState createState() => _TicketsWidgetState();
}

class _TicketsWidgetState extends State<TicketsWidget> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TicketsController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Tickets (3)",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 16.sp),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: SizedBox(
          height: 100.h,
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: 7.h,),
                  CarouselTickets(),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
                      margin: EdgeInsets.symmetric(horizontal: 8.w),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 4), // changes position of shadow
                            ),
                          ],
                          color: greyColor,
                          borderRadius: BorderRadius.circular(20.sp)),
                      child: Obx(
                        () => Row(
                          children: [
                            Expanded(
                                child: animatedContainerModel(
                                    "next".tr, 0, controller.selected.value)),
                            SizedBox(
                              width: 1.w,
                            ),
                            Expanded(
                                child: animatedContainerModel(
                                    "historique".tr, 1, controller.selected.value))
                          ],
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
