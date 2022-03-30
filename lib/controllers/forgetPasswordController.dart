import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constWidgets/snackBar.dart';
import '../services/AuthService.dart';
import 'confirmation.controller.dart';

class ForgetPasswordController extends GetxController{
  TextEditingController emailController = TextEditingController();

  var isSending = false.obs;
  void switchBool() {
    isSending.value = !isSending.value;
  }

  forgetPassword() async {
    switchBool();
    if (emailController.text.isEmpty ) {
      switchBool();
      return;
    }
    var response = await AuthService.forgetPasswordSendVerificationAccount(emailController.text);
    if (response.error) {
      snackBarModel("Echec","check your information" , true);
      switchBool();
    } else {
      ConfirmationController().toScreen(emailController.text, response.data ?? "",0);
      switchBool();
    }
  }
}