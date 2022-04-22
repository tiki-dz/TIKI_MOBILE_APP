import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sizer/sizer.dart';

import '../../../data/font.data.dart';
import '../../../data/pallete.data.dart';

class CarouselDetailsTickets extends StatefulWidget {
  const CarouselDetailsTickets({Key? key}) : super(key: key);

  @override
  _CarouselDetailsTicketsState createState() => _CarouselDetailsTicketsState();
}

class _CarouselDetailsTicketsState extends State<CarouselDetailsTickets> {
  List myList = [1, 2, 3];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 70.h,
        viewportFraction: 0.76,
        enlargeCenterPage: true,
        reverse: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 700),
        autoPlayCurve: Curves.fastOutSlowIn,
      ),
      items: myList.map((wallet) {
        return itemCarousel();
      }).toList(),
    );
  }
}

Widget itemCarousel() {
  return Container(
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
                "Knives out",
                style: TextStyle(
                    color: Color(0xff6C6C6C),
                    fontWeight: semiBold,
                    fontSize: 15.sp),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "HANANI Fetheddine",
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
                      SizedBox(width: 3.w,),
                      itemMatrix("Date","Mar , jan 20 , 2020 "),
                      SizedBox(width: 5.w,),
                      itemMatrix("Lieu","Cinéma centrale")
                    ],
                  ),
                  SizedBox(height: 2.h,),
                  Row(
                    children: [
                      SizedBox(width: 3.w,),
                      itemMatrix("Time","12:00 am - 11:00 pm"),
                      SizedBox(width: 5.w,),
                      itemMatrix("Prix","1200 DA")
                    ],
                  ),
                ],
              ),
              SizedBox(height: 4.h,),
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
              SizedBox(height: 4.h,),
              Image.asset("assets/icons/codeBR.png"),
              SizedBox(height: 3.h,),

            ],
          ),
        ),
      ],
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
        style:TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 9.sp,
            color: Colors.black),
      )
    ],
  );
}
