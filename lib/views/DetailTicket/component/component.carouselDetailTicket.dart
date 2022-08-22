import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tiki/Models/model.Ticket.dart';
import 'package:tiki/Models/model.event.dart';
import 'package:tiki/views/Authentification/components/component.button.dart';
import 'package:tiki/views/DetailTicket/widget.scan.dart';

import '../../../Models/model.purchase.dart';
import '../../../constWidgets/cashedNetwork.dart';
import '../../../data/font.data.dart';
import '../../../data/pallete.data.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CarouselDetailsTickets extends StatefulWidget {
  CarouselDetailsTickets({required this.purchase, Key? key}) : super(key: key);

  PurchaseModel purchase;

  @override
  _CarouselDetailsTicketsState createState() => _CarouselDetailsTicketsState();
}

class _CarouselDetailsTicketsState extends State<CarouselDetailsTickets> {
  bool showQRCODE = false ;
  String QRcode = "";
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        enableInfiniteScroll: false,

        height: 70.h,
        viewportFraction: 0.76,
        enlargeCenterPage: true,
        reverse: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 700),
        autoPlayCurve: Curves.fastOutSlowIn,
      ),
      items: widget.purchase.tickets.map((ticket) {
        return itemCarousel(ticket, widget.purchase.event);
      }).toList(),
    );
  }
}

Widget itemCarousel(TicketModel ticket, EventModel event) {
  return InkWell(
    onTap: (){
      Get.bottomSheet(
          Container(
            height: 50.h,
            decoration:  BoxDecoration(
                color: KOrange,
                borderRadius: BorderRadius.only(topRight: Radius.circular(10.sp))
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center
              ,
              children: [
                Container(
                  padding: EdgeInsets.all(20.sp),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.sp)),
                  child: QrImage(
                    data: ticket.QRCode,
                    version: QrVersions.auto,
                    size: 150.sp,
                  ),
                ),
                SizedBox(height: 4.h),
                InkWell(
                  onTap: (){
                    Get.back();
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.w),
                    padding: EdgeInsets.symmetric(vertical: 2.h),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.sp),
                        color: Colors.white
                    ),
                    child: const Center(
                      child: Text("OK"),
                    ),
                  ),
                )
              ],
            ),
          )
      );

    },
    child: Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 2.w),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 4), // changes position of shadow
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.sp),
      ),
      child: Column(
        children: [
          Expanded(
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.sp),
                      topRight: Radius.circular(10.sp)),
                  child: cachedNetworkModel(event.ticketImage))),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: Column(
              children: [
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  event.name,
                  style: TextStyle(
                      color: Color(0xff6C6C6C),
                      fontWeight: semiBold,
                      fontSize: 15.sp),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  ticket.firstName + " " + ticket.lastName,
                  style: TextStyle(
                      color: Colors.black, fontWeight: semiBold, fontSize: 12.sp),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 3.w,
                        ),
                        itemMatrix("date".tr, event.startDateTitleFormat() +","+ event.startDateSubTitleFormat()),
                        SizedBox(
                          width: 5.w,
                        ),
                        itemMatrix("lieu".tr, event.addressExact())
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 3.w,
                        ),
                        itemMatrix("time".tr, "12:00 am - 11:00 pm"),
                        SizedBox(
                          width: 5.w,
                        ),
                        itemMatrix("price".tr, event.price+" DA")
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 4.h,
                ),
                const DottedLine(
                  direction: Axis.horizontal,
                  lineLength: double.infinity,
                  lineThickness: 0.5,
                  dashLength: 4.0,
                  dashColor: Colors.grey,
                  dashRadius: 0.0,
                  dashGapLength: 4.0,
                  dashGapColor: Colors.transparent,
                  dashGapRadius: 0.0,
                ),
                SizedBox(
                  height: 2.h,
                ),
                event.previous() ? SizedBox(height: 88.sp,) : QrImage(
                  data: ticket.QRCode,
                  version: QrVersions.auto,
                  size: 80.sp,
                ),
                SizedBox(
                  height: 2.h,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget itemMatrix(String title, String content) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12.sp,
            color: Color(0xff6C6C6C)),
      ),
      Text(
        content,
        style: TextStyle(
            fontWeight: FontWeight.w500, fontSize: 9.sp, color: Colors.black),
      )
    ],
  );
}
