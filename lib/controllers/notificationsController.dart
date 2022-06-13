import 'package:get/get.dart';
import 'package:tiki/Models/model.notification.dart';

import '../services/NotificationService.dart';

class NotificationsController extends GetxController {
  int pageUser = -1;
  int pageAll = -1;
  List<NotificationModel> notificationUser = [];
  List<NotificationModel> notificationAll = [];
  bool nextNotificationUser = false;
  bool fetchingNotification = false;
  bool fetchingNotificationPage = false;
  var selected = 0.obs;

  switchFetchingNotification() {
    fetchingNotification = !fetchingNotification;
    update();
  }

  switchFetchingNotificationPage() {
    fetchingNotificationPage = !fetchingNotificationPage;
  }

  updateSelected(int cas) {
    selected.value = cas;
    update();
  }

  NotificationModel currentNotification(int index) {
    return selected.value == 0
        ? notificationAll[index]
        : notificationUser[index];
  }

  int currentLength() {
    return selected.value == 0
        ? notificationAll.length
        : notificationUser.length;
  }

  getNotifications() async {
    switchFetchingNotification();
    await getNotificationAll();
    await getNotificationUser();
    switchFetchingNotification();
  }

  getNotificationUser() async {
    var response = await NotificationService.getNotificationUser(++pageUser);
    if (response.error != true) {
      notificationUser = response.data ?? [];
    }
  }

  getNotificationAll() async {
    var response = await NotificationService.getNotificationAll(++pageAll);
    if (response.error != true) {
      notificationAll = response.data ?? [];
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
