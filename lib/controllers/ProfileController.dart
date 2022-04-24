import 'package:tiki/Models/model.user.dart';
import 'package:tiki/controllers/localController.dart';
import 'package:get/get.dart';
import 'package:tiki/controllers/wrapperProfileController.dart';

import '../views/ButtomBar/widget.bottomBar.dart';

class ProfileController extends GetxController{
  late UserModel userProfile = LocalController.getProfile();


  getUpdatedProfile(){
    userProfile = LocalController.getProfile();
    update();
  }



  logOut(){
    LocalController.logOut();
    WrapperProfileController controller = Get.find<WrapperProfileController>();
    controller.updateSign();
    Get.offAll(()=>const BottomBarWidget());
  }

}