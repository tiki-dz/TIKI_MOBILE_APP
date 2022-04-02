import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiki/constWidgets/snackBar.dart';
import 'package:tiki/views/Authentification/widget.login.dart';
import 'package:tiki/views/Authentification/widget.resetPassword.dart';

import '../services/AuthService.dart';


class ResetPasswordController extends GetxController{

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  String email;
  String? token;


  ResetPasswordController({required this.email,required this.token});

  var isSending = false.obs;
  void switchBool() {
    isSending.value = !isSending.value;
  }

  resetPassword() async {
    switchBool();
    if(passwordController.text.length<8){
      snackBarModel('Password', 'password must have 8 lettre', true);
      switchBool();
      return ;
    }
    if(passwordController.text !=  confirmPasswordController.text){
      snackBarModel('note the same', 'password and confirm password are not the same', true);
      switchBool();
      return ;
    }
    var response = await AuthService.forgetPasswordChangePasswordAccount(email, passwordController.text,token);
    if(response.error){
      snackBarModel("Echec", "try after afiew minute", true);
    } else{
      Get.to(LogInWidget());
    }
    switchBool();

  }

}