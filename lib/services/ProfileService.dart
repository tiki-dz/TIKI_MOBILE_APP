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

class ProfileService {
  static Future<General<UserModel>> profile() async {
    try {
      http.Response response = await http.post(Uri.parse(urlProfile),
          headers: {'x-access-token': LocalController.getToken()});
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        return General<UserModel>(data: UserModel.fromJson(jsonData["data"]));
      }
      return General<UserModel>(error: true);
    } on Exception catch (e) {
      return General<UserModel>(error: true);
    }
  }

  static Future<General<String>> updateProfile(UserModel user) async {
    print(user.sexe);
    Map<String, String?> body ={} ;

    body = {
      "firstName": user.firstName,
      "lastName": user.lastName,
      "sexe": user.sexe == 1 ? "Homme" : "Femme",
      "birthDate": user.birthDate,
      "phoneNumber" :user.phoneNumber
    };
    if(user.city?.isNotEmpty ?? true){
      body["city"] = user.city;
    }



    try {
      http.Response response = await http.put(Uri.parse(urlUpdateProfile),
          body: body, headers: {'x-access-token': LocalController.getToken()});
      if (response.statusCode == 200) {
        return General<String>(data: response.body);
      }
      return General<String>(error: true);
    } on Exception catch (e) {
      return General<String>(error: true);
    }
  }

  static Future<General<String>> updatePicProfile(File image) async {
    try {
      var request = http.MultipartRequest(
        'PUT',
        Uri.parse(urlUpdatePicProfile),
      );
      Map<String, String> headers = {
        'x-access-token': LocalController.getToken()
      };
      final mime = lookupMimeType(image.path).toString(); //<- get mime type

      request.files.add(http.MultipartFile(
          'updateimage', image.readAsBytes().asStream(), image.lengthSync(),
          filename: image.path,
          contentType: MediaType("image", mime.split("/")[1])));
      request.headers.addAll(headers);
      http.StreamedResponse streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      if (response.statusCode == 200) {
        return General<String>(data: "");
      }
      return General<String>(error: true);
    } on Exception catch (e) {
      return General<String>(error: true);
    }
  }

  static Future<General<bool>> resetPassword(
      String currentPassword, String newPassword) async {
    try {
      http.Response response =
      await http.put(Uri.parse(urlResetPassword), body: {
        "password": currentPassword,
        "newPassword": newPassword,
      }, headers: {
        'x-access-token': LocalController.getToken()
      });
      if (response.statusCode == 200) {
        return General<bool>();
      }
      return General<bool>(error: true);
    } on Exception catch (e) {
      return General<bool>(error: true);
    }
  }
}
