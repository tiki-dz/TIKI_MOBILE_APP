import 'package:get/get.dart';

class NotificationsController extends GetxController{
  var selected = 0.obs;

  updateSelected(int cas ){
    selected.value = cas;
  }
}