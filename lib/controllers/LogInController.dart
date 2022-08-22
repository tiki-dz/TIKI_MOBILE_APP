import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiki/controllers/ProfileController.dart';
import 'package:tiki/controllers/initialisationController.dart';
import 'package:tiki/controllers/wrapperProfileController.dart';
import 'package:tiki/views/ButtomBar/widget.bottomBar.dart';
import '../constWidgets/snackBar.dart';
import '../services/AuthService.dart';
import 'localController.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class LogInController extends GetxController {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  var isUpdating = false.obs;
  late var tokenNotification;
  var fbm = FirebaseMessaging.instance;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onInit() async {
    getTokenNotification();
    super.onInit();
  }




  getTokenNotification(){
    fbm.getToken().then((token) {
      tokenNotification = token;
    });
  }

  void switchBool() {
    isUpdating.value = !isUpdating.value;
  }


  String? validateEmail(String? email){
    if(emailController.text.isEmpty){
      return "email_req".tr;
    }

    if(!EmailValidator.validate(emailController.text)){
      return "email_valid".tr;
    }
    return null;
  }

  String? validatePassword(String? password) {
    if (validateEmail("") == null) {
      if (passwordController.text.isEmpty) {
        return "password_req".tr;
      }
      if (passwordController.text.length < 8) {
        return "password_valid".tr;
      }
      return null;
    }
    return null;
  }
  login() async {

    if(formKey.currentState?.validate() ?? true ){
      switchBool();
      var response = await AuthService.login(emailController.text, passwordController.text,tokenNotification);
      if (response.error) {
        snackBarModel("echec".tr,"check_informations".tr  , true);
        switchBool();
      } else {
        LocalController.setToken(response.token);
        LocalController.setProfile(response.data);
        WrapperProfileController wrapperController = Get.find<WrapperProfileController>();
        wrapperController.updateSign();
        Get.put(ProfileController());
        ProfileController profileController = Get.find<ProfileController>();
        profileController.getUpdatedProfile();
        InitialisationController initialisationController = Get.find<InitialisationController>();
        initialisationController.getSavedEvents();
        Get.offAll(() => const BottomBarWidget(),
            transition: Transition.rightToLeft);

        //BottomBarController controller = Get.find<BottomBarController>();
        //controller.changeIndex(3);
      }
    }


  }

}


