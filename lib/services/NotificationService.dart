import 'dart:convert';
import 'dart:io';

import 'package:mime/mime.dart';
import 'package:tiki/Models/model.user.dart';
import 'package:tiki/Models/model.registration.dart';
import 'package:tiki/controllers/localController.dart';
import 'package:tiki/data/server.data.dart';
import 'package:http/http.dart' as http;

import 'general/general.dart';

import 'package:http_parser/http_parser.dart';

class NotificationService {
  static Future<General<bool>> getNotificationUser(int page) async {
    try {

      http.Response response = await http.get(Uri.parse(notificationUser+"page=0&size=2"),
          headers: {'x-access-token': LocalController.getToken() });

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        return General<bool>(data: true);
      }
      return General<bool>(error: true);
    } on Exception catch (e) {

      return General<bool>(error: true);
    }
  }
}