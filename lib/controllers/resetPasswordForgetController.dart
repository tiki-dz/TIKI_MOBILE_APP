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
      return 'password is required';
    }

    if (passwordController.text.length < 8) {
      return 'password must have 8 lettre';
    }
    return null;
  }

  String? validateConfirmPassword(String? password) {
    if(validatePassword("") == null){
      if (confirmPasswordController.text.isEmpty) {
        return 'confirmation password is required';
      }

      if (confirmPasswordController.text != passwordController.text) {
        return 'password are not the same';
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
        snackBarModel("Echec", "try after afiew minute", true);
      } else {
        Get.to(()=>LogInWidget());
      }
      switchBool();
    }
  }
}
