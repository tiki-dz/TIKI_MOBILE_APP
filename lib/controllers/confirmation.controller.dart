import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiki/controllers/resetPasswordController.dart';
import 'package:tiki/controllers/wrapperProfileController.dart';
import 'package:tiki/views/Home/widget.home.dart';
import '../constWidgets/snackBar.dart';
import '../services/AuthService.dart';
import '../views/Authentification/widget.confirmation.dart';
import '../views/Authentification/widget.resetPasswordForget.dart';
import '../views/ButtomBar/widget.bottomBar.dart';
import 'localController.dart';

class ConfirmationController extends GetxController {

  //cas = 0 pour send code en validation , et cas =1 pour send code en forgetPassword
  late int cas ;
  late String email;
  late String? token;


  ConfirmationController({required this.cas,required this.email,required this.token});

  final TextEditingController codePinController = TextEditingController();
  var sendFirst = false;
  var isProcessing = false.obs;
  late Timer timer;
  int start = 50;


  void switchBool() {
    isProcessing.value = !isProcessing.value;
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
    late dynamic response;
    if(cas == 0){
      response = await AuthService.verifyCode(email, token,codePinController.text );
      LocalController.setToken(response.token);
      LocalController.setProfile(response.data);
      WrapperProfileController controller = Get.find<WrapperProfileController>();
      controller.updateSign();
    } else{
      response = await AuthService.forgetPasswordValidateAccount(email, token, codePinController.text);
    }

    if (response.error) {
      snackBarModel("Echek","check your information" , true);
      switchBool();
    } else {
       cas ==0 ?   Get.off(() => const BottomBarWidget()) : Get.off(() => ResetPasswordForgetWidget(email: email,token: response.data,));
    }
  }
}
