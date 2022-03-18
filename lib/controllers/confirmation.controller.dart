import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ConfirmatioController extends GetxController {
  final TextEditingController codePinController = TextEditingController();
  late Timer timer;
  int start = 50;
  @override
  void onReady() {
    startTimer();
    super.onReady();
  }

  void startTimer() {
    start = 50;
    update();
    const oneSec = const Duration(seconds: 1);
    timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start == 0) {
          timer.cancel();
          update();
        } else {
          start--;
          update();
        }
      },
    );
  }
}
