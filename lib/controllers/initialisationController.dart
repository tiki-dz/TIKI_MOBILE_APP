import 'package:get/get.dart';
import 'package:tiki/Models/model.event.dart';
import 'package:tiki/controllers/localController.dart';
import 'package:tiki/services/AuthService.dart';
import 'package:tiki/services/EventService.dart';

import '../Models/model.city.dart';

class InitialisationController extends GetxController{
  List<EventModel> events = [];
  List<CityModel> cities = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getSavedEvents();
    getProfile();
    getCities();
  }


  getCities()async {
    var response = await AuthService.getCities();
    if(!response.error){
      cities = response.data ?? [];
    }
  }

  getProfile()async{
    if(LocalController.getSign()){
      var response = await AuthService.getProfile();
      if(!response.error){
        LocalController.setProfile(response.data);
      }
    }

  }
  getSavedEvents()async {
    if(LocalController.getSign()) {
      var response = await EventService.getSavedEvent();
      events = response.data ?? [];
    }
  }

  deleteEvent(int id){
    events  = events.where((element) => element.id != id).toList();
  }

  addEvent(EventModel event){
    events.insert(0, event);
  }
}