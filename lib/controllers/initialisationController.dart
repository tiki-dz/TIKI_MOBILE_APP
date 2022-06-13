import 'package:get/get.dart';
import 'package:tiki/Models/model.event.dart';
import 'package:tiki/services/EventService.dart';

class InitialisationController extends GetxController{
  List<EventModel> events = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getSavedEvents();

  }

  getSavedEvents()async {
    var response = await EventService.getSavedEvent();
    events = response.data ?? [];
  }

  deleteEvent(int id){
    events  = events.where((element) => element.id != id).toList();
    print('///Zezez');
    print(events.length);
  }

  addEvent(EventModel event){
    events.insert(0, event);
  }
}