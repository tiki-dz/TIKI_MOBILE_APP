import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:tiki/controllers/resetPasswordForgetController.dart';
import 'package:tiki/controllers/wrapperProfileController.dart';
import 'package:tiki/views/Home/widget.home.dart';
import '../constWidgets/snackBar.dart';
import '../services/AuthService.dart';
import '../views/Authentification/widget.confirmation.dart';
import '../views/Authentification/widget.resetPasswordForget.dart';
import '../views/ButtomBar/widget.bottomBar.dart';
import 'localController.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class ConfirmationController extends GetxController {

  //cas = 0 pour send code en validation , et cas =1 pour send code en forgetPassword
  late int cas ;
  late String email;
  late String? token;
  late String password;
  late var tokenNotification;
  var fbm = FirebaseMessaging.instance;


  ConfirmationController({required this.cas,required this.email,required this.token,required this.password});

  final TextEditingController codePinController = TextEditingController();
  var isProcessing = false.obs;
  late Timer timer;
  int start = 50;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getTokenNotification();
    startTimer();
  }

  getTokenNotification(){
    fbm.getToken().then((token) {
      tokenNotification = token;
    });
  }

  void switchBool() {
    isProcessing.value = !isProcessing.value;
  }

  void startTimer() {
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
      snackBarModel("echek".tr,"code_pin_error".tr , true);
      return "";
    }
    startTimer();
    late dynamic response;
    if(cas == 0){
      response = await AuthService.verifyCode(email, token,codePinController.text ,tokenNotification);
      LocalController.setToken(response.token);
      LocalController.setProfile(response.data);
      WrapperProfileController controller = Get.find<WrapperProfileController>();
      controller.updateSign();
    } else{
      response = await AuthService.forgetPasswordValidateAccount(email, token, codePinController.text);
    }
    if (response.error) {
      snackBarModel("echek".tr,"check_informations".tr , true);
      switchBool();
    } else {
       cas ==0 ?   Get.off(() => const BottomBarWidget()) : Get.off(() => ResetPasswordForgetWidget(email: email,token: response.data,));
    }
  }

  resendCodeSignUp() async {
    startTimer();
    var response = await AuthService.resendVerification(email, password);
    if (response.error) {
      switchBool();
    }else{
      Fluttertoast.showToast(
          msg: "code sent",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black.withOpacity(0.2),
          textColor: Colors.black,
          fontSize: 16.0
      );
      token = response.data;
    }
  }

  resendCodeForget() async {
    startTimer();
    var response = await AuthService.forgetPasswordSendVerificationAccount(email,token);
    if (response.error) {
      switchBool();
    }else{
      Fluttertoast.showToast(
          msg: "code sent",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black.withOpacity(0.2),
          textColor: Colors.black,
          fontSize: 16.0
      );
      token = response.data;
    }
  }


}
