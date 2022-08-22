import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiki/Models/model.registration.dart';
import 'package:tiki/controllers/confirmation.controller.dart';
import 'package:intl/intl.dart';
import 'package:tiki/controllers/wrapperProfileController.dart';
import 'package:tiki/views/Authentification/widget.confirmation.dart';
import '../constWidgets/snackBar.dart';
import '../services/AuthService.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'ProfileController.dart';

class SignUpController extends GetxController {
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late RxString birthDateController = "".obs;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController confirmPasswordController =
  TextEditingController();
  late var tokenNotification;
  var fbm = FirebaseMessaging.instance;

  final TextEditingController phoneNumberController =
  TextEditingController();
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

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  var radioSexe = 0;

  changeRadio(int? value){
    radioSexe = value?? 0;
    update();
  }

  String? validatePassword(String? password) {
    if(validateName("") == null && (validateLastName("")) == null && (validateEmail("")) == null  && validateDate("")==null  && validatePhoneNumber("")==null) {
      if (passwordController.text.isEmpty) {
        return 'password_req'.tr;
      }

      if (passwordController.text.length < 8) {
        return 'password_valid'.tr;
      }
      return null;
    }
    return null;
  }

  /* String? validateConfirmPassword(String? password) {
    if (validateName("") == null && (validateLastName("")) == null &&
        (validateEmail("")) == null && (validatePassword("")) == null  && validateDate("")==null ) {
      if (confirmPasswordController.text.isEmpty) {
        return  "confirmation_password_req".tr;
      }

      if (confirmPasswordController.text != passwordController.text) {
        return  "password_not_same".tr;
      }
      return null;
    }
    return null;
  } */

  String? validateEmail(String? email){
    if(validateName("") == null && validateLastName("") == null && validateDate("")==null ){
      if(emailController.text.isEmpty){
        return "email_req".tr;
      }

      if(!EmailValidator.validate(emailController.text)){
        return "email_valid".tr;
      }
    }
    return null;
  }

  String? validateName(String? name){
    if(nameController.text.isEmpty){
      return "name_req".tr;
    }

    if(nameController.text.length<3 || !RegExp(r'^[a-zA-Z]+$').hasMatch(nameController.text)){
      return "name_valid".tr;
    }
    return null;
  }

  String? validateLastName(String? lastName ){
    if(validateName("") == null){
      if(lastNameController.text.isEmpty){
        return "last_name_req".tr;
      }

      if(lastNameController.text.length<3 || !RegExp(r'^[a-zA-Z]+$').hasMatch(lastNameController.text)){
        return "last_name_valid".tr;
      }
    }
    return null;
  }

  String? validateDate(String? date){
    if(validateName("") == null && validateLastName("") == null){
      if(birthDateController.isEmpty){
        return "birthdate_req".tr;
      }
    }
    return null;
  }

  String? validatePhoneNumber(String? date){
    if (validateName("") == null && (validateLastName("")) == null &&
        (validateEmail("")) == null && validateDate("")==null )
    {
      if(phoneNumberController.text.isEmpty){
        return "phone_num".tr;
      }
      if(phoneNumberController.text.length != 10 || phoneNumberController.text[0] != "0" || !RegExp(r'^[0-9]+$').hasMatch(phoneNumberController.text)){
        return "phone_num_valid".tr;
      }
    }
    return null;
  }

  void changeDate(DateTime dateTime) {
    final DateTime date= dateTime;
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(date);
    birthDateController.value = formatted.toString();
  }

  var isUpdating = false.obs;

  void switchBool() {
    isUpdating.value = !isUpdating.value;
  }

  signUp() async {

    if(formKey.currentState?.validate() ?? true ){
      switchBool();
      var response = await AuthService.signUp(RegistrationModel(
          nameController.text,
          lastNameController.text,
          birthDateController.value,
          emailController.text,
          passwordController.text,phoneNumberController.text));

      if (response.error) {
        snackBarModel("echec".tr,response.errorMessage , true);
        switchBool();
      } else {
        Get.to(()=>ConfirmationWidget(email: emailController.text, token: response.data, cas: 0,password : passwordController.text));
        switchBool();
      }}
  }

}
