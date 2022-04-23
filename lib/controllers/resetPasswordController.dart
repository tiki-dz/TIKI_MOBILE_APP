import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constWidgets/snackBar.dart';
import '../services/ProfileService.dart';

class ResetPasswordController extends GetxController{
  TextEditingController passwordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? validatePassword(String? password) {
    if (passwordController.text.isEmpty) {
      return 'password is required';
    }

    if (passwordController.text.length < 8) {
      return 'password must have 8 lettre';
    }
    return null;
  }

  String? validateConfirmPassword(String? password) {
    if(validatePassword("") == null){
      if (newPasswordController.text.isEmpty) {
        return 'confirmation password is required';
      }

      if (newPasswordController.text == passwordController.text) {
        return 'password are the same';
      }
    }

    return null;
  }

  var isSending = false.obs;

  void switchBool() {
    isSending.value = !isSending.value;
  }

  resetPassword() async {
    if (formKey.currentState?.validate() ?? true) {
      switchBool();

      var response = await ProfileService.resetPassword(passwordController.text, newPasswordController.text);
      if (response.error) {
        snackBarModel("Echec", "try after afiew minute", true);
      } else {

        snackBarModel("Succes", "operation done", false);

      }
      switchBool();

    }
  }
}