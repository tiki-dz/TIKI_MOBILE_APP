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

class SignUpController extends GetxController {
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late RxString birthDateController = "".obs;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();



  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  var radioSexe = 0;

  changeRadio(int? value){
    radioSexe = value?? 0;
    update();
  }

  String? validatePassword(String? password) {
    if(validateName("") == null && (validateLastName("")) == null && (validateEmail("")) == null  && validateDate("")==null) {
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

  String? validateConfirmPassword(String? password) {
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
  }

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

    if(nameController.text.length<2){
      return "name_valid".tr;
    }
    return null;
  }

  String? validateLastName(String? email){
    if(validateName("") == null){
      if(lastNameController.text.isEmpty){
        return "last_name_req".tr;
      }

      if(lastNameController.text.length<2){
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
        passwordController.text));

    if (response.error) {
      snackBarModel("echec".tr,response.errorMessage , true);
      switchBool();
    } else {
      WrapperProfileController controller = Get.find<WrapperProfileController>();
      controller.updateSign();
      Get.to(ConfirmationWidget(email: emailController.text, token: response.data, cas: 0,password : passwordController.text));
      switchBool();
    }}
  }

}
