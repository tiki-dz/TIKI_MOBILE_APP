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
    if(validateName("") == null && (validateLastName("")) == null && (validateEmail("")) == null) {
      if (passwordController.text.isEmpty) {
        return 'password is required';
      }

      if (passwordController.text.length < 8) {
        return 'password must have 8 lettre';
      }
      return null;
    }
  }

  String? validateConfirmPassword(String? password) {
    if (validateName("") == null && (validateLastName("")) == null &&
        (validateEmail("")) == null && (validatePassword("")) == null ) {
      if (confirmPasswordController.text.isEmpty) {
        return 'confirmation password is required';
      }

      if (confirmPasswordController.text != passwordController.text) {
        return 'password are not the same';
      }
      return null;
    }
  }

  String? validateEmail(String? email){
    if(validateName("") == null && (validateLastName("")) == null){
      if(emailController.text.isEmpty){
        return "email is required";
      }

      if(!EmailValidator.validate(emailController.text)){
        return "please verify your email";
      }
    }
    return null;

  }

  String? validateName(String? name){
    if(nameController.text.isEmpty){
      return "name is required";
    }

    if(nameController.text.length<2){
      return "please enter a valid name";
    }
    return null;
  }

  String? validateLastName(String? email){
    if(validateName("") == null){
      if(lastNameController.text.isEmpty){
        return "last name is required";
      }

      if(lastNameController.text.length<2){
        return "please enter a valid last nname";
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
      snackBarModel("Echeck","check your information" , true);
      switchBool();
    } else {
      WrapperProfileController controller = Get.find<WrapperProfileController>();
      controller.updateSign();
      Get.to(ConfirmationWidget(email: emailController.text, token: response.data, cas: 0));
      switchBool();
    }}
  }

}
