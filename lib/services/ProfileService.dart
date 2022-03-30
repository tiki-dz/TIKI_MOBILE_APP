import 'dart:convert';

import 'package:tiki/Models/model.user.dart';
import 'package:tiki/Models/model.registration.dart';
import 'package:tiki/controllers/localController.dart';
import 'package:tiki/data/server.data.dart';
import 'package:http/http.dart' as http;

import 'general/general.dart';

class ProfileJson{
  static Future<General<UserModel>> profile() async {
    try {
      http.Response response =
      await http.post(Uri.parse(urlProfile), headers: {
        'x-access-token' : LocalController.getToken()
      });
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        return General<UserModel>(data: UserModel.fromJson(jsonData["data"]));
      }
      return General<UserModel>(error: true);
    } on Exception catch (e) {
      return General<UserModel>(error: true);
    }
  }
}