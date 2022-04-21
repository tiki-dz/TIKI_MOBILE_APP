import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sizer/sizer.dart';
import 'package:tiki/data/font.data.dart';
import 'package:tiki/data/pallete.data.dart';

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

Widget itemModel() => Container(
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
      child: Column(
        children: [
          Expanded(
              child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.sp),
                  topRight: Radius.circular(10.sp)),
              image: const DecorationImage(
                  image: NetworkImage(
                      "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cG9ydHJhaXQlMjBtYW58ZW58MHx8MHx8&w=1000&q=80"),
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
    );
