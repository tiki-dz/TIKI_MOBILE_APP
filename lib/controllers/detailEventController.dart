import 'package:get/get.dart';
class DetailEventController extends GetxController {
  var icon = "saveEventNotSolid".obs;

  switchIcon(){
    icon.value= icon.value=="saveEventNotSolid" ?"saveEvent":"saveEventNotSolid";
  }



  saveEvent(){
    switchIcon();
  }

  saveOrUnSaved(){

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    saveOrUnSaved();
  }
}