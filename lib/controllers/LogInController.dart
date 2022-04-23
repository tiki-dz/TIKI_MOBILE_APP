import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiki/controllers/wrapperProfileController.dart';
import 'package:tiki/views/ButtomBar/widget.bottomBar.dart';
import '../constWidgets/snackBar.dart';
import '../services/AuthService.dart';
import 'localController.dart';
import 'package:email_validator/email_validator.dart';

class LogInController extends GetxController {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  var isUpdating = false.obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void switchBool() {
    isUpdating.value = !isUpdating.value;
  }


  String? validateEmail(String? email){
    if(emailController.text.isEmpty){
      return "email is required";
    }

    if(!EmailValidator.validate(emailController.text)){
      return "please verify your email";
    }
    return null;
  }

  String? validatePassword(String? password) {
    if (validateEmail("") == null) {
      if (passwordController.text.isEmpty) {
        return "password is required";
      }

      if (passwordController.text.length < 8) {
        return "password must be at least 8";
      }
      return null;
    }
  }
  login() async {

    if(formKey.currentState?.validate() ?? true ){
      switchBool();
      var response = await AuthService.login(emailController.text, passwordController.text);
      if (response.error) {
        snackBarModel("Echec","check your information" , true);
        switchBool();
      } else {
        LocalController.setToken(response.token);
        LocalController.setProfile(response.data);
        WrapperProfileController controller = Get.find<WrapperProfileController>();
        controller.updateSign();
        Get.offAll(() => BottomBarWidget(),
            transition: Transition.rightToLeft);

        //BottomBarController controller = Get.find<BottomBarController>();
        //controller.changeIndex(3);
      }
    }


  }

}


