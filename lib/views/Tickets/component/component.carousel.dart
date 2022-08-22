import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sizer/sizer.dart';
import 'package:tiki/Models/model.purchase.dart';
import 'package:tiki/constWidgets/noItem.dart';
import 'package:tiki/controllers/ticketsController.dart';
import 'package:tiki/data/font.data.dart';
import 'package:tiki/data/pallete.data.dart';
import 'package:get/get.dart';
import 'package:tiki/views/DetailTicket/widget.detailTicket.dart';
import '../../../constWidgets/cashedNetwork.dart';
import '../../DetailEvent/component/component.info.dart';

class CarouselTickets extends StatefulWidget {
  const CarouselTickets({Key? key}) : super(key: key);

  @override
  _CarouselTicketsState createState() => _CarouselTicketsState();
}

class _CarouselTicketsState extends State<CarouselTickets> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TicketsController>();
    return Expanded(
      child: controller.currentList().isEmpty
          ? Center(
        child: noItemWidgetModel(),
      )
          : Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        child: CarouselSlider(
          options: CarouselOptions(
            enableInfiniteScroll: false,
            viewportFraction: 0.7,
            scrollDirection: Axis.vertical,
            enlargeCenterPage: true,
            reverse: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 700),
            autoPlayCurve: Curves.fastOutSlowIn,
          ),
          items: controller.currentList().map((purchase) {
            return itemModel(purchase);
          }).toList(),
        ),
      ),
    );
  }
}

Widget itemModel(PurchaseModel purchaseModel) => InkWell(
  onTap: () {
    Get.to(() => DetailTicketWidget(purchase: purchaseModel),
        transition: Transition.leftToRight);
  },
  child: Container(
    margin: EdgeInsets.symmetric(horizontal: 7.w),
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        spreadRadius: 2,
        blurRadius: 7,
        offset: const Offset(0, 4), // changes position of shadow
      ),
    ], color: Colors.white, borderRadius: BorderRadius.circular(10.sp)),
    height: 50.h,
    child: Stack(
      children: [
        Column(
          children: [
            Expanded(
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.sp),
                        topRight: Radius.circular(10.sp)),
                    child: cachedNetworkModel(
                        purchaseModel.event.ticketImage))),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 3.h,
                  ),
                  Text(
                    purchaseModel.event.name,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: semiBold,
                        fontSize: 15.sp),
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  Text(
                    purchaseModel.event.agoOrAfterDate(),
                    style: TextStyle(
                        color: KOrange,
                        fontWeight: semiBold,
                        fontSize: 10.sp),
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  eventInfoMode(
                    purchaseModel.event.startDateTitleFormat(),
                    purchaseModel.event.startDateSubTitleFormat(),
                    "eventCalandrier",
                  ),
                  eventInfoMode(
                    "Algeria," + purchaseModel.event.city(),
                    purchaseModel.event.addressExact(),
                    "eventPlace",
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
            top: 1.h,
            left: 3.w,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.sp),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset:
                    const Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              height: 30.sp,
              width: 30.sp,
              child: Padding(
                padding:
                EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Text(
                    purchaseModel.nbTickets.toString() + "P",
                    style: TextStyle(fontWeight: semiBold, fontSize: 13.sp),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ))
      ],
    ),
  ),
);
