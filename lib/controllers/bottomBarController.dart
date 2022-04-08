import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../views/Home/widget.home.dart';
import '../views/Notification/widget.notification.dart';
import '../views/Wrapper/widget.wrapperProfile.dart';


class BottomBarController extends GetxController{
  int selectedIndex =  0;

  List<Widget> myWidgets = [
    HomeWidget(),
    NotificationsWidget(),
    HomeWidget(),
    WrapperProfile(),
  ];

  Widget current = HomeWidget();

  changeIndex(int index){
    selectedIndex = index;
    current = myWidgets[selectedIndex];
    update();
  }

  @override
  void onInit() {

    // TODO: implement onInit
    super.onInit();
  }
}