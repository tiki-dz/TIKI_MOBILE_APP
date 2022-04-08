import 'package:get/get.dart';

import 'localController.dart';

class WrapperProfileController extends GetxController {
  late bool sign;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    updateSign();
  }

  updateSign() {
    sign = LocalController.getSign();
    update();
  }
}
