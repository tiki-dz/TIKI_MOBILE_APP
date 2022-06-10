

import 'package:tiki/Models/model.categoris.dart';
import 'package:http/http.dart' as http;
import 'package:tiki/Models/model.event.dart';
import '../Models/model.user.dart';
import '../controllers/localController.dart';
import '../data/server.data.dart';
import 'general/general.dart';
import 'dart:convert';


class HomeService{
  static Future<General<List<CategoriesModel>>> getCategories() async {
    try {
      http.Response response = await http.get(Uri.parse(urlCategories));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        List<CategoriesModel> categories =[];
        var data = jsonData["data"]["category"];
        for (var item in data){
          categories.add(CategoriesModel.fromJson(item));
        }
        return General<List<CategoriesModel>>(data:categories);
      }
      return General<List<CategoriesModel>>(error: true);
    } on Exception catch (e) {
      return General<List<CategoriesModel>>(error: true);
    }
  }

  static Future<General<List<EventModel>>> getEventsCategories(String categories) async {
    try {
      http.Response response = await http.get(Uri.parse(urlEventsHome+categories));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        List<EventModel> events =[];
        var data = jsonData["events"];
        for (var item in data){
          events.add(EventModel.fromJson(item));
        }
        return General<List<EventModel>>(data:events);
      }
      return General<List<EventModel>>(error: true);
    } on Exception catch (e) {

      return General<List<EventModel>>(error: true);
    }
  }

}