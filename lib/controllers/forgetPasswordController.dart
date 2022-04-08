import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constWidgets/snackBar.dart';
import '../services/AuthService.dart';
import '../views/Authentification/widget.confirmation.dart';
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
      Get.to(ConfirmationWidget(email: emailController.text, token: response.data, cas: 1));
      switchBool();
    }
  }
}