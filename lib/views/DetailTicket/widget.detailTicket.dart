import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tiki/Models/model.purchase.dart';

import '../../data/pallete.data.dart';
import 'component/component.carouselDetailTicket.dart';

class DetailTicketWidget extends StatefulWidget {
  DetailTicketWidget({required this.purchase, Key? key}) : super(key: key);

  PurchaseModel purchase;

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
              title: Text(
                "detail_ticket".tr,
                style: TextStyle(fontSize: 13.sp),
              ),
              centerTitle: true,
              elevation: 0,
            ),
            body: Container(
              height: 100.h,
              width: 100.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12.sp),
                    topLeft: Radius.circular(12.sp)),
              ),
              child: Column(
                children: [
                  SizedBox(height: 4.h,),
                  Text(
                    widget.purchase.nbTickets.toString() +" " +"personnes".tr,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp),
                  ),
                  Expanded(
                    child
                        : CarouselDetailsTickets(
                      purchase: widget.purchase,
                    ),
                  ),
                ],
              ),
            )));
  }
}
