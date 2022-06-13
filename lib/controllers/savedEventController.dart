import 'package:get/get.dart';
import 'package:tiki/Models/model.event.dart';
import 'package:tiki/controllers/initialisationController.dart';

import '../services/EventService.dart';

class SavedEventController extends GetxController{

  List<EventModel> events = [];
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getSavedEvents();
  }

  getSavedEvents(){
    var controller = Get.find<InitialisationController>();
    events = controller.events;
    update();
  }


}