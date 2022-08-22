import 'dart:convert';

import 'package:tiki/Models/model.event.dart';

import '../controllers/localController.dart';
import '../data/server.data.dart';
import 'general/general.dart';
import 'package:http/http.dart' as http;

class EventService {
  static Future<General<bool>> saveEvent(int idEvent) async {

    var user = LocalController.getProfile();

    var body = {
      "idEvent": idEvent.toString(), "idClient": user.idClient.toString()
    };

    try {
      http.Response response=  await http.post(Uri.parse(urlSaveEvent), body:body);

      return General<bool>(error: true);
    } on Exception catch (e) {
      return General<bool>(error: true);
    }
  }

  static Future<General<bool>> unSaveEvent(int idEvent) async {
    var user = LocalController.getProfile();
    var body = {
      "idEvent": idEvent.toString(), "idClient": user.idClient.toString()
    };

    try {
      http.Response response=  await http.post(Uri.parse(urlUnSaveEvent), body: body);

      return General<bool>(error: true);
    } on Exception catch (e) {
      return General<bool>(error: true);
    }
  }

  static Future<General<List<EventModel>>> getSavedEvent() async {
    var user = LocalController.getProfile();
    try {
      String url = urlSavedEvent + "${user.idClient}/savedEvents";
      http.Response response = await http.get(Uri.parse(url),
          headers: {'x-access-token': LocalController.getToken()});
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        List<EventModel> events = [];
        for (var item in jsonData["data"]) {
          events.add(EventModel.fromJson(item));
        }
        print(events.length);
        return General<List<EventModel>>(data: events);
      }
      return General<List<EventModel>>(error: true);
    } on Exception catch (e) {
      return General<List<EventModel>>(error: true);
    }
  }
}
