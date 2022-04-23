import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constWidgets/snackBar.dart';
import '../services/AuthService.dart';
import '../views/Authentification/widget.confirmation.dart';
import 'confirmation.controller.dart';
import 'package:email_validator/email_validator.dart';

class ForgetPasswordController extends GetxController{

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  var isSending = false.obs;
  void switchBool() {
    isSending.value = !isSending.value;
  }

  String? validateEmail(String? email){
    email ?? "";
    if(emailController.text.isEmpty){
      return "email is required";
    }

    if(!EmailValidator.validate(email?? "")){
      return "please verify your email";
    }
  }

  forgetPassword() async {
    if(formKey.currentState?.validate() ?? true ){
    switchBool();
    var response = await AuthService.forgetPasswordSendVerificationAccount(emailController.text);
    if (response.error) {
      snackBarModel("Echec","check your information" , true);
      switchBool();
    } else {
      Get.to(ConfirmationWidget(email: emailController.text, token: response.data, cas: 1));
      switchBool();
    }
  }}
}