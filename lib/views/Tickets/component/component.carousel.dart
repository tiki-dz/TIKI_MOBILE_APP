import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sizer/sizer.dart';
import 'package:tiki/controllers/ticketsController.dart';
import 'package:tiki/data/font.data.dart';
import 'package:tiki/data/pallete.data.dart';
import 'package:get/get.dart';
import 'package:tiki/views/DetailTicket/widget.detailTicket.dart';
import '../../DetailEvent/component/component.info.dart';

class CarouselTickets extends StatefulWidget {
  const CarouselTickets({Key? key}) : super(key: key);

  @override
  _CarouselTicketsState createState() => _CarouselTicketsState();
}

class _CarouselTicketsState extends State<CarouselTickets> {
  List myList = [1, 2, 3];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        child: CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 0.7,
            scrollDirection: Axis.vertical,
            enlargeCenterPage: true,
            reverse: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 700),
            autoPlayCurve: Curves.fastOutSlowIn,
          ),
          items: myList.map((wallet) {
            return itemModel();
          }).toList(),
        ),
      ),
    );
  }
}

Widget itemModel() => InkWell(
  onTap: (){
    Get.to(()=>DetailTicketWidget(),transition: Transition.leftToRight);
  },
  child:   Container(
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
                    child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.sp),
                        topRight: Radius.circular(10.sp)),
                    image: const DecorationImage(
                        image: NetworkImage(
                            "https://www.lesuricate.org/wp-content/uploads/2019/11/knives-out.jpg"),
                        fit: BoxFit.fill),
                  ),
                )),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 3.h,
                      ),
                      Text(
                        "The expendables",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: semiBold,
                            fontSize: 15.sp),
                      ),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      Text(
                        "reste deux semaine",
                        style: TextStyle(
                            color: KOrange, fontWeight: semiBold, fontSize: 10.sp),
                      ),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      eventInfoMode(
                        "Mar, Jan 30 ,2020",
                        "12:00 AM - 12:00 PM",
                        "eventCalandrier",
                      ),
                      eventInfoMode(
                        "Algeria, Oran",
                        "Cinéma centrale",
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
            Positioned(top: 1.h,left: 3.w,child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.sp),
                color: Colors.white,
              ),
              height: 30.sp,
              width: 30.sp,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
                child: const FittedBox(
                  fit: BoxFit.fill,
                  child: Text(
                    "5P",
                    style: TextStyle(fontWeight: semiBold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ))
          ],
        ),

      ),
);
