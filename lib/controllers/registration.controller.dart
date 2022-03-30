import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiki/Models/model.registration.dart';
import 'package:tiki/controllers/confirmation.controller.dart';
import 'package:intl/intl.dart';
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
    switchBool();
    if (nameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        emailController.text.isEmpty ||
        birthDateController.value.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      switchBool();
      return;
    }
    if (passwordController.text.length < 8) {
      switchBool();
      return;
    }
    if (passwordController.text != confirmPasswordController.text) {
      switchBool();
      return;
    }
    var response = await AuthService.signUp(RegistrationModel(
        nameController.text,
        lastNameController.text,
        birthDateController.value,
        emailController.text,
        passwordController.text));
    if (response.error) {
      snackBarModel("error","check your information" , true);
      switchBool();
    } else {
      ConfirmationController().toScreen(emailController.text, response.data ?? "" , 1);
      switchBool();
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
