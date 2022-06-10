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

class HomeWidgettest2 extends StatefulWidget {
  const HomeWidgettest2({Key? key}) : super(key: key);

  @override
  _HomeWidgettest2State createState() => _HomeWidgettest2State();
}

class _HomeWidgettest2State extends State<HomeWidgettest2>{

  final controller = Get.put(HomeController());
  Color grey = Color(0Xff7A7A7A);
  List myList = [1, 2, 3];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }



  @override
  Widget build(BuildContext context) {

    return SafeArea(child: Scaffold(
      /* appBar: PreferredSize(
        preferredSize: Size.fromHeight(30.h),
        child: SliverAppBar(
          elevation: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: linear,
            ),
          ),
          bottom: PreferredSize(
            preferredSize:  Size.fromHeight(30.h),
            child: Column(
              children: [
                SearchBar(),
                Obx(()=> CarouselHome(height : controller.animation.value* 20.h)),
              ],
            ),
          ),
        ),
      ),*/
      //                    Obx(()=> CarouselHome(height : controller.animation.value* 20.h)),

      /*Container(
        height: 100.h,
        width: 100.w,
        decoration: BoxDecoration(
          gradient: linear,
        ),
        child: Column(
          children: [

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
                          );
                    })

            ),
          ],
        ),
      ),*/
    ));
  }
}
