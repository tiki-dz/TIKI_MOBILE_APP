import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiki/constWidgets/snackBar.dart';
import 'package:tiki/views/Authentification/widget.login.dart';
import 'package:tiki/views/Authentification/widget.resetPasswordForget.dart';

import '../services/AuthService.dart';

class ResetPasswordForgetController extends GetxController {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  String email;
  String? token;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  ResetPasswordForgetController({required this.email, required this.token});

  String? validatePassword(String? password) {
    if (passwordController.text.isEmpty) {
      return 'password_req';
    }

    if (passwordController.text.length < 8) {
      return 'password_valid'.tr;
    }
    return null;
  }

  String? validateConfirmPassword(String? password) {
    if(validatePassword("") == null){
      if (confirmPasswordController.text.isEmpty) {
        return 'confirmation_password_req'.tr;
      }

      if (confirmPasswordController.text != passwordController.text) {
        return 'password_not_same'.tr;
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

      var response = await AuthService.forgetPasswordChangePasswordAccount(
          email, passwordController.text, token);
      if (response.error) {
        snackBarModel("echec".tr, "try".tr, true);
      } else {
        Get.to(()=>const LogInWidget());
      }
      switchBool();
    }
  }
}
