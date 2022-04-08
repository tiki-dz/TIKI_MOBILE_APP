import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiki/controllers/wrapperProfileController.dart';
import 'package:tiki/views/ButtomBar/widget.bottomBar.dart';
import '../constWidgets/snackBar.dart';
import '../services/AuthService.dart';
import 'localController.dart';

class LogInController extends GetxController {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  var isUpdating = false.obs;

  void switchBool() {
    isUpdating.value = !isUpdating.value;
  }

  login() async {
    switchBool();
    if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9-]+\.[a-zA-Z]+").hasMatch(emailController.text)){
      snackBarModel("Email","please verify your email" , true);
      switchBool();
      return;
    }
    if (passwordController.text.length < 8) {
      snackBarModel("Password","the password must have 8 carachtere at lest" , true);
      switchBool();
      return;
    }
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


