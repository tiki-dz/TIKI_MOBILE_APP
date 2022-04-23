import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiki/controllers/homeController.dart';
import '../../data/font.data.dart';
import '../../data/pallete.data.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'component/widget.carousel.dart';
import 'component/widget.eventMode.dart';
import 'component/widget.searchBar.dart';
import 'package:get/get.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> with SingleTickerProviderStateMixin {


  Color grey = Color(0Xff7A7A7A);
  List myList = [1, 2, 3];



  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Container(
      height: 100.h,
      width: 100.w,
      decoration: BoxDecoration(
        gradient: linear,
      ),
      child: Column(
        children: [
          SearchBar(),
          CarouselHome(),
          SizedBox(
            height: 1.5.h,
          ),
          Expanded(
              child: GetBuilder<HomeController>(
                  init: controller,
                  builder: (context) {
                    return Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(12.sp),
                                topLeft: Radius.circular(12.sp)),
                            color: Colors.white),
                        child: ListView.builder(
                            controller: controller.scrollController,
                            itemCount: controller.events?.length,
                            itemBuilder: (context, indexFirst) => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(3.w, 2.h, 3.w, 0.5.h),
                                      child: Text(
                                        controller.events?[indexFirst].keys
                                                .toList()
                                                .first ??
                                            "",
                                        style: GoogleFonts.poppins(
                                            fontSize: 15.sp,
                                            fontWeight: semiBold),
                                      ),
                                    ),
                                    SizedBox(
                                        height: 27.h,
                                        child: ListView.builder(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 1.h, horizontal: 4.w),
                                            scrollDirection: Axis.horizontal,
                                            itemCount: controller
                                                .events?[indexFirst].values
                                                .toList()
                                                .first
                                                ?.length,
                                            itemBuilder: (context, index) =>
                                                eventModel(controller
                                                    .events?[indexFirst].values
                                                    .toList().first?[index]))),
                                  ],
                                )));
                  })

              ),
        ],
      ),
    );
  }
}
