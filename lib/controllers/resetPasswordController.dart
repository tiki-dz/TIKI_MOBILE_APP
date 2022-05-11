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
      return 'password_req'.tr;
    }

    if (passwordController.text.length < 8) {
      return 'password_valid'.tr;
    }
    return null;
  }

  String? validateConfirmPassword(String? password) {
    if(validatePassword("") == null){
      if (newPasswordController.text.isEmpty) {
        return 'confirmation_password_req'.tr;
      }

      if (newPasswordController.text == passwordController.text) {
        return 'password_same'.tr;
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
        snackBarModel("echec".tr, "try".tr, true);
      } else {

        snackBarModel("success".tr, "operation_done".tr, false);

      }
      switchBool();

    }
  }
}