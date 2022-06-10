import 'package:tiki/Models/model.categoris.dart';
import 'package:http/http.dart' as http;
import 'package:tiki/Models/model.event.dart';
import '../Models/model.user.dart';
import '../controllers/localController.dart';
import '../data/server.data.dart';
import 'general/general.dart';
import 'dart:convert';

class SearchService {
  static Future<General<List<EventModel>>> getSearchEvents(
      int page, String search) async {
    String url =
        "http://$ip:5002/api/admin/event?search=$search&tag=twitter&page=$page&size=20";
    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        List<EventModel> events = [];
        var data = jsonData["events"];
        for (var item in data) {
          events.add(EventModel.fromJson(item));
        }
        return General<List<EventModel>>(
            data: events,
            haveNext: jsonData["totalPages"] == jsonData["currentPage"]);
      }
      return General<List<EventModel>>(error: true);
    } on Exception catch (e) {
      return General<List<EventModel>>(error: true);
    }
  }
}
