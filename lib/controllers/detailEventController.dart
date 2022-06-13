import 'package:get/get.dart';
import 'package:tiki/Models/model.event.dart';
import 'package:tiki/controllers/initialisationController.dart';
import 'package:tiki/controllers/savedEventController.dart';
import 'package:tiki/services/EventService.dart';

class DetailEventController extends GetxController {
  late EventModel event;
  bool exist = false;
  late bool newCase = false;

  DetailEventController({required this.event});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checkFavorites();
  }

  checkFavorites() {
    final controller = Get.find<InitialisationController>();
    for (var item in controller.events) {
      if (item.id == event.id) {
        exist = true;
        newCase = exist;
        icon = "saveEvent".obs;
        break;
      }
    }
  }

  var icon = "saveEventNotSolid".obs;

  switchIcon() {
    icon.value =
        icon.value == "saveEventNotSolid" ? "saveEvent" : "saveEventNotSolid";
    newCase = !newCase;
    final controller = Get.find<InitialisationController>();

    print(newCase);
    if (newCase == true) {
      controller.addEvent(event);
    } else {
      controller.deleteEvent(event.id);
    }
    if (Get.isRegistered<SavedEventController>()) {
      final controller = Get.find<SavedEventController>();
      controller.getSavedEvents();
    }
  }

  saveEvent() {
    switchIcon();
  }

  saveOrUnSaved() {
    if (exist != newCase) {
      if (newCase == true) {
        EventService.saveEvent(event.id);
      } else {
        EventService.unSaveEvent(event.id);
      }
    }
  }

  @override
  void dispose() {
    saveOrUnSaved();
    // TODO: implement dispose
    super.dispose();
  }
}
