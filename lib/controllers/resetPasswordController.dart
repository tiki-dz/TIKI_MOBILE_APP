import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tiki/views/Authentification/widget.resetPassword.dart';


class ResetPasswordController extends GetxController{

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  late String email;
  var isSending = false.obs;
  void switchBool() {
    isSending.value = !isSending.value;
  }

  toScreen(String email){
    this.email = email;
    Get.to(const ResetPasswordWidget());
  }
}