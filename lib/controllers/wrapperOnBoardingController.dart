import 'package:get/get.dart';
import 'package:tiki/controllers/localController.dart';


class WrapperOnBoardingController extends GetxController{
  late bool first;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    first = LocalController.getFirst();
    if(first == true ){
      LocalController.setFirst(false);
    }
  }
}