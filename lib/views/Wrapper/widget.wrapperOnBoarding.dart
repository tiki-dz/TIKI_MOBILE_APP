import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiki/controllers/localController.dart';
import 'package:tiki/controllers/wrapperOnBoardingController.dart';
import 'package:tiki/views/ButtomBar/widget.bottomBar.dart';
import 'package:tiki/views/Home/widget.home.dart';

import '../onBoarding/widget.onBoarding.dart';

class WrapperOnBoardingWidget extends StatelessWidget {
  const WrapperOnBoardingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WrapperOnBoardingController());
    return controller.first ? OnBoardingWidget() : const BottomBarWidget();
  }
}
