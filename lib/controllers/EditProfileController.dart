import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';
import 'package:tiki/Models/model.city.dart';
import 'package:tiki/Models/model.user.dart';
import 'package:tiki/controllers/ProfileController.dart';
import 'package:tiki/controllers/initialisationController.dart';
import 'package:tiki/views/Profile/EditProfiles/widget.editProfile.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiki/views/Profile/Profile/widget.profile.dart';
import '../constWidgets/snackBar.dart';
import '../services/ProfileService.dart';
import '../views/ButtomBar/widget.bottomBar.dart';
import 'localController.dart';

class EditProfileController extends GetxController {
  late UserModel user = LocalController.getProfile();
  List<CityModel> cities = [];
  late TextEditingController lastNameController;
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneNumberController;
  late TextEditingController cityController;
  late RxString birthDate = RxString(user.birthDate);
  String? picture;
  late int radioSexe;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCities();
    radioSexe = user.sexe ?? 0;
    picture = user.picture;
    lastNameController = TextEditingController(text: user.lastName);
    nameController = TextEditingController(text: user.firstName);
    emailController = TextEditingController(text: user.email);
    phoneNumberController = TextEditingController(text: "0" + user.phoneNumber);
    cityController = TextEditingController(text: user.city ?? "");
  }

  void getCities() async {
    final controller = Get.find<InitialisationController>();
    cities = controller.cities;
    if (cities.isEmpty) {
      await controller.getCities();
      cities = controller.cities;
    }
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

  String? validateDate(String? date) {
    if (validateName("") == null && validateLastName("") == null) {
      if (birthDate.isEmpty) {
        return "birthdate_req".tr;
      }
    }
    return null;
  }

  String? validatePhoneNumber(String? date) {
    if (validateName("") == null &&
        (validateLastName("")) == null &&
        validateDate("") == null) {
      if (phoneNumberController.text.isEmpty) {
        return "phone_num".tr;
      }
      if (phoneNumberController.text.length != 10 ||
          phoneNumberController.text[0] != "0" ||
          !RegExp(r'^[0-9]+$').hasMatch(phoneNumberController.text)) {
        return "phone_num_valid".tr;
      }
    }
    return null;
  }

  String? validateCity(String? city) {
    return null;
  }

  String? validateEmail(String? email) {
    return null;
  }

  String? validateName(String? name) {
    if (nameController.text.isEmpty) {
      return "name_req".tr;
    }

    if (nameController.text.length < 3 ||
        !RegExp(r'^[a-zA-Z]+$').hasMatch(nameController.text)) {
      return "name_valid".tr;
    }
    return null;
  }

  String? validateLastName(String? email) {
    if (validateName("") == null) {
      if (lastNameController.text.isEmpty) {
        return "last_name_req".tr;
      }

      if (lastNameController.text.length < 3 ||
          !RegExp(r'^[a-zA-Z]+$').hasMatch(lastNameController.text)) {
        return "last_name_valid".tr;
      }
    }
    return null;
  }

  updateProfile() async {
    if (formKey.currentState?.validate() ?? true) {
      switchBool();
      if (!imageFromNetwork) {
        var response = await ProfileService.updatePicProfile(imageFile);
        if (response.error) {
          snackBarModel("echec".tr, "try".tr, true);
          switchBool();
          return;
        }
      }

      var response = await ProfileService.updateProfile(UserModel(
          score: user.score,
          idClient: user.idClient,
          idUser: user.idUser,
          firstName: nameController.text,
          lastName: lastNameController.text,
          birthDate: birthDate.value,
          email: emailController.text,
          sexe: radioSexe,
          city: cityController.text,
          phoneNumber: phoneNumberController.text));

      if (response.error) {
        snackBarModel("echec".tr, "try".tr, true);
        switchBool();
      } else {
        final initController = Get.find<InitialisationController>();
        await initController.getProfile();
        switchBool();
        snackBarModel("succes".tr, "operation_done".tr, false);
        final controller = Get.find<ProfileController>();
        controller.getUpdatedProfile();
        Get.offAll(() => const BottomBarWidget());
      }
    }
  }
}
