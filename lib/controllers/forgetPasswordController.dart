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
      return "email_req".tr;
    }

    if(!EmailValidator.validate(email?? "")){
      return "email_valid".tr;
    }
  }

  forgetPassword() async {
    if(formKey.currentState?.validate() ?? true ){
    switchBool();
    var response = await AuthService.forgetPasswordSendVerificationAccount(emailController.text,null);
    if (response.error) {
      snackBarModel("echec".tr,"check_informations".tr , true);
      switchBool();
    } else {
      Get.to(()=>ConfirmationWidget(email: emailController.text, token: response.data, cas: 1,password: "",));
      switchBool();
    }
  }}
}