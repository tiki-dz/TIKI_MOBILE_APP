import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../data/pallete.data.dart';
import 'component/component.carouselDetailTicket.dart';

class DetailTicketWidget extends StatefulWidget {
  const DetailTicketWidget({Key? key}) : super(key: key);

  @override
  _DetailTicketWidgetState createState() => _DetailTicketWidgetState();
}

class _DetailTicketWidgetState extends State<DetailTicketWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: KOrange,
            appBar: AppBar(
              backgroundColor: KOrange,
              title:  Text(
                "detail_ticket".tr,
                style: TextStyle(fontSize: 13.sp),
              ),
              centerTitle: true,
              elevation: 0,
            ),
            body: Container(
              height: 100.h,
              width: 100.w,
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12.sp),
                  topLeft: Radius.circular(12.sp)),),
              child: CarouselDetailsTickets(),
            )));
  }
}
