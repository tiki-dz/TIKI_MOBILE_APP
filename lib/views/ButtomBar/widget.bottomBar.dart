import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tiki/controllers/bottomBarController.dart';
import 'package:tiki/data/pallete.data.dart';
import 'package:tiki/views/Home/widget.home.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tiki/views/Notification/widget.notification.dart';
import 'package:tiki/views/Profile/Profile/widget.profile.dart';
import 'package:tiki/views/Wrapper/widget.wrapperProfile.dart';
import 'bottomBarPackage.dart';
import '../Home/widget.home.dart';
import 'component/component.appBar.dart';

class BottomBarWidget extends StatefulWidget {
  const BottomBarWidget({Key? key}) : super(key: key);

  @override
  _BottomBarWidgetState createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BottomBarController());
    return SafeArea(
        child:GetBuilder<BottomBarController>( // no need to initialize Controller ever again, just mention the type
          builder: (value) =>  Scaffold(
            backgroundColor: Colors.white,
            body: controller.current,
            bottomNavigationBar: BottomNavyBar(
              containerHeight: 7.h,
              selectedIndex: controller.selectedIndex,
              showElevation: true, // use this to remove appBar's elevation
              onItemSelected: controller.changeIndex,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              items: [
                BottomNavyBarItem(
                  textAlign: TextAlign.center,
                  icon: SvgPicture.asset('assets/icons/home.svg',
                      color: controller.selectedIndex == 0 ? KOrange : Colors.black),
                  title: Text(
                    "home".tr,
                    style: TextStyle(
                        color: controller.selectedIndex == 0 ? KOrange : Colors.black,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400),
                  ),
                  activeColor: Colors.white,
                ),
                BottomNavyBarItem(
                  textAlign: TextAlign.center,
                  icon: SvgPicture.asset('assets/icons/notifications.svg',
                      color: controller.selectedIndex  == 1 ? KOrange  : Colors.black),
                  title: Text(
                    "notifications".tr,
                    style: TextStyle(
                        color: controller.selectedIndex  == 1 ? KOrange  : Colors.black,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400),
                  ),
                  activeColor: Colors.white,
                ),
                BottomNavyBarItem(
                  textAlign: TextAlign.center,
                  icon: SvgPicture.asset('assets/icons/ticket.svg',
                      color: controller.selectedIndex  == 2 ?KOrange  : Colors.black),
                  title: Text("tickets".tr,
                      style: TextStyle(
                          color: controller.selectedIndex  == 2 ? KOrange  : Colors.black,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400)),
                  activeColor: Colors.white,
                ),
                BottomNavyBarItem(
                  textAlign: TextAlign.center,
                  icon: SvgPicture.asset('assets/icons/compte.svg',
                      color: controller.selectedIndex  == 3 ? KOrange  : Colors.black),
                  title: Text("profil".tr,
                      style: TextStyle(
                          color: controller.selectedIndex  == 3 ? KOrange  : Colors.black,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400)),
                  activeColor: Colors.white,
                ),
              ],
            ),
          )),
        );
  }
}
