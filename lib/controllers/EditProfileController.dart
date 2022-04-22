import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';
import 'package:tiki/Models/model.user.dart';
import 'package:tiki/views/Profile/EditProfiles/widget.editProfile.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiki/views/Profile/Profile/widget.profile.dart';
import '../constWidgets/snackBar.dart';
import '../services/ProfileService.dart';
import 'localController.dart';

class EditProfileController extends GetxController {
  late UserModel user = LocalController.getProfile();

  late TextEditingController lastNameController;

  late TextEditingController nameController;

  late TextEditingController emailController;
  late TextEditingController phoneNumberController;
  late TextEditingController cityController;
  late RxString birthDate = RxString(user.birthDate);
  String? picture;
  late int radioSexe;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    radioSexe = user.sexe?? 0;
    picture = user.picture;
    lastNameController = TextEditingController(text: user.lastName);
    nameController = TextEditingController(text: user.firstName);
    emailController = TextEditingController(text: user.email);
    phoneNumberController = TextEditingController(text: user.phoneNumber ?? "");
    cityController = TextEditingController(text: user.city ?? "");
  }

  void changeDate(DateTime dateTime) {
    final DateTime date = dateTime;
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(date);
    birthDate.value = formatted.toString();
  }

  var isUpdating = false.obs;
  void switchBool() {
    isUpdating.value = !isUpdating.value;
  }

  ////////// sexe radio
  changeRadio(int? value) {
    radioSexe = value ?? 0;
    update();
  }

  /////////// pick image

  // if he wanna edit
  late File imageFile;
  bool imageFromNetwork = true;

  void takePick() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      imageFile = File(image.path);
      imageFromNetwork = false;
      update();
    }
  }

  updateProfile() async {
    switchBool();
    if (nameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        emailController.text.isEmpty ||
        birthDate.value.isEmpty) {
      switchBool();
      return;
    }
    if(!imageFromNetwork){
      var response = await ProfileService.updatePicProfile(imageFile);
      switchBool();
      if(response.error){
        snackBarModel("Echec", "try after afiew minute", true);
        return;
      }

    }

    var response = await ProfileService.updateProfile(UserModel(
        firstName: nameController.text,
        lastName: lastNameController.text,
        phoneNumber: phoneNumberController.text,
        birthDate: birthDate.value,
        email: emailController.text,
        sexe: radioSexe,
        city: cityController.text,
      ));

    if (response.error) {
      snackBarModel("Echec", "try after afiew minute", true);
      switchBool();
    } else {
      LocalController.setProfile(response.data);
      switchBool();
      snackBarModel("Succes", "operation done", false);
      Get.offAll(()=>ProfileWidget());
    }
  }
}
