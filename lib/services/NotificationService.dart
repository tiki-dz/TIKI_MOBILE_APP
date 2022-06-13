import 'dart:convert';
import 'dart:io';

import 'package:mime/mime.dart';
import 'package:tiki/Models/model.notification.dart';
import 'package:tiki/Models/model.user.dart';
import 'package:tiki/Models/model.registration.dart';
import 'package:tiki/controllers/localController.dart';
import 'package:tiki/data/server.data.dart';
import 'package:http/http.dart' as http;

import 'general/general.dart';

import 'package:http_parser/http_parser.dart';

class NotificationService {
  static Future<General<List<NotificationModel>>> getNotificationUser(int page) async {
    try {
      http.Response response = await http.get(Uri.parse(urlNotificationUser+"page=$page&size=20"),
          headers: {'x-access-token': LocalController.getToken() });
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        List<NotificationModel> notifications = [];
        for(var item in jsonData["data"]["notifs"]){
           notifications.add(NotificationModel.fromJson(item));
        }
        return General<List<NotificationModel>>(data: notifications);
      }
      return General<List<NotificationModel>>(error: true);
    } on Exception catch (e) {

      return General<List<NotificationModel>>(error: true);
    }
  }

  static Future<General<List<NotificationModel>>> getNotificationAll(int page) async {
    try {
      http.Response response = await http.get(Uri.parse(urlNotificationAll+"page=$page&size=20"),
          headers: {'x-access-token': LocalController.getToken() });
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        List<NotificationModel> notifications = [];

        for(var item in  jsonData["data"]["notifs"]){
          notifications.add(NotificationModel.fromJson(item));
        }
        return General<List<NotificationModel>>(data: notifications);
      }
      return General<List<NotificationModel>>(error: true);
    } on Exception catch (e) {

      return General<List<NotificationModel>>(error: true);
    }
  }
}