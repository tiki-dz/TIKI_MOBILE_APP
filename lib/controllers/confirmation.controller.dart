import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiki/controllers/resetPasswordController.dart';
import 'package:tiki/views/Home/widget.home.dart';
import '../constWidgets/snackBar.dart';
import '../services/AuthService.dart';
import '../views/Authentification/widget.confirmation.dart';

class ConfirmationController extends GetxController {

  //cas = 0 pour send code en validation , et cas =1 pour send code en forgetPassword
  late int cas ;
  late String email;
  late String token;


  void toScreen(String email , String token,int cas){
    this.cas = cas;
    this.email = email;
    this.token = token;
    Get.to(ConfirmationWidget());
  }

  final TextEditingController codePinController = TextEditingController();
  var sendFirst = false;
  var isSending = false.obs;
  late Timer timer;
  int start = 50;


  void switchBool() {
    isSending.value = !isSending.value;
  }

  void startTimer() {
    sendFirst = true;
    start = 50;
    update();
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
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

  sendCode() async {
    switchBool();
    if(codePinController.text.length<6){
      snackBarModel("Echek","code pin must have 6 chiffres" , true);
      return "";
    }
    startTimer();
    var response = await AuthService.verifyCode(email, token,codePinController.text ,cas);
    if (response.error) {
      snackBarModel("Echek","check your information" , true);
      switchBool();
    } else {
     cas ==0 ?   Get.off(() => const HomeWidget()) : ResetPasswordController().toScreen(email);
    }
  }
}
