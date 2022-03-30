import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';
import 'package:tiki/Models/model.user.dart';
import 'package:tiki/views/Profile/EditProfiles/widget.editProfile.dart';

class EditProfileController extends GetxController{

  late UserModel user ;

  late TextEditingController lastNameController ;
  late TextEditingController nameController ;
  late TextEditingController emailController;
  late TextEditingController phoneNumberController;
  late TextEditingController cityController;
  late RxString birthDate;
  late RxString sexe;



  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    lastNameController = TextEditingController(text: user.lastName);
    nameController = TextEditingController(text: user.firstName);
    emailController = TextEditingController(text: user.email);
    phoneNumberController = TextEditingController(text: user.phoneNumber?? "add phone number");
    cityController = TextEditingController(text: user.city?? "add your city");
    sexe.value = user.sexe ?? "add your sexe";
    birthDate.value = user.birthDate ;
  }






  void changeDate(DateTime dateTime) {
    final DateTime date= dateTime;
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(date);
    birthDate.value = formatted.toString();
  }

  var isUpdating = false.obs;

  void switchBool() {
    isUpdating.value = !isUpdating.value;
  }


  void toScreen(UserModel user){
    this.user = user;
    Get.to(EditProfileWidget());
  }

}