import 'package:get/get.dart';

import '../services/NotificationService.dart';

class NotificationsController extends GetxController{

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    getNotificationUser();
  }

  var selected = 0.obs;

  updateSelected(int cas ){
    selected.value = cas;
  }

  getNotificationUser(){
    NotificationService.getNotificationUser(0);
  }

}