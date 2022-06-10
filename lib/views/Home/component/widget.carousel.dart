import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:tiki/controllers/homeController.dart';
class CarouselHome extends StatefulWidget {
  CarouselHome({Key? key}) : super(key: key);


  @override
  _CarouselHomeState createState() => _CarouselHomeState();
}

class _CarouselHomeState extends State<CarouselHome> {
  List myList = [1, 2, 3];


  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Opacity(
      opacity: controller.opacity /12,
      child: Transform.scale(
        scale: controller.opacity /12,
        child: CarouselSlider(
          options: CarouselOptions(
            enlargeCenterPage: true,
            height: controller.opacity/ 26 * 45.h,
            autoPlay: true,
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
double radius = 9;
Widget itemModel() => Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 1.h),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(radius.sp),
            color: Colors.black,
          ),
          width: 80.w,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(9.sp),
            child: Image.network(
              "https://horreurqc.b-cdn.net/wp-content/uploads/2019/11/MV5BNDM2NTBiOWYtN2E3Mi00MDdjLTk2MjMtZjlmMWE2N2QxNjdjXkEyXkFqcGdeQXVyNjg2NjQwMDQ@._V1_SY1000_CR0014991000_AL_-1155x770.jpg",
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 1.h),
          width: 80.w,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.transparent,
                  Colors.transparent,
                  Colors.black,
                ],
              ),
              borderRadius: BorderRadius.circular(radius.sp)),
        )
      ],
    );
