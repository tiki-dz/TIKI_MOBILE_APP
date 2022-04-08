import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../data/font.data.dart';
import '../../data/pallete.data.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'component/widget.carousel.dart';
import 'component/widget.eventMode.dart';
import 'component/widget.searchBar.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  Color grey = Color(0Xff7A7A7A);
  List myList = [1, 2, 3];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 100.w,
      decoration: BoxDecoration(
        gradient: linear,
      ),
      child: Column(
        children: [
          InkWell(onTap: () {}, child: SearchBar()),
          CarouselHome(),
          SizedBox(
            height: 1.5.h,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12.sp),
                      topLeft: Radius.circular(12.sp)),
                  color: Colors.white),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 2.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 3.w, bottom: 1.h),
                      child: Text(
                        "Popular",
                        style: GoogleFonts.poppins(
                            fontSize: 14.sp, fontWeight: semiBold),
                      ),
                    ),
                    SizedBox(
                        height: 27.h,
                        child: ListView.builder(
                            padding: EdgeInsets.symmetric(
                                vertical: 1.h, horizontal: 4.w),
                            scrollDirection: Axis.horizontal,
                            itemCount: 4,
                            itemBuilder: (context, index) => eventModel())),
                    SizedBox(height: 2.h),
                    Padding(
                      padding: EdgeInsets.only(left: 3.w),
                      child: Text(
                        "Sport",
                        style: GoogleFonts.poppins(
                            fontSize: 16.sp, fontWeight: semiBold),
                      ),
                    ),
                    SizedBox(height: 1.h),
                    SizedBox(
                        height: 27.h,
                        child: ListView.builder(
                            padding: EdgeInsets.symmetric(
                                vertical: 1.h, horizontal: 4.w),
                            scrollDirection: Axis.horizontal,
                            itemCount: 4,
                            itemBuilder: (context, index) => eventModel())),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
