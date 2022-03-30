import 'dart:convert';

import 'package:tiki/Models/model.user.dart';
import 'package:tiki/Models/model.registration.dart';
import 'package:tiki/data/server.data.dart';
import 'package:http/http.dart' as http;

import '../data/server.data.dart';
import 'general/general.dart';

class AuthService {
  static Future<General<String>> login(String email, String password) async {
    try {
      http.Response response = await http.post(Uri.parse(urlLogin),
          body: {"email": email, "password": password});
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        return General<String>(
            data: response.body, token: jsonData["data"]["token"]);
      }
      return General<String>(error: true);
    } on Exception catch (e) {
      return General<String>(error: true);
    }
  }

  static Future<General<String>> signUp(RegistrationModel registration) async {
    try {
      http.Response response = await http.post(Uri.parse(urlSignup), body: {
        'email': registration.email,
        'firstName': registration.name,
        'lastName': registration.lastName,
        'password': registration.password,
        'birthDate': registration.birthDay,
      });

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        return General<String>(data: jsonData["data"]["token"]);
      }
      return General<String>(error: true);
    } on Exception catch (e) {
      return General<String>(error: true);
    }
  }

  //cas = 0 pour send code en validation , et cas =1 pour send code en forgetPassword
  static Future<General<String>> verifyCode(
      String email, String token, String code, int cas) async {
    try {
      http.Response response = await http.post(Uri.parse(cas == 0 ? urlVerifyCode : urlForgetPasswordValidateAccount),
          headers: {'x-access-token': token},
          body: {'email': email, 'code': code});
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        return General<String>(data: jsonData["data"]["token"]);
      }
      return General<String>(error: true);
    } on Exception catch (e) {
      return General<String>(error: true);
    }
  }


  static Future<General<String>> forgetPasswordSendVerificationAccount(String email) async {
    try {
      http.Response response = await http.post(Uri.parse(urlForgetPasswordSendVerificationAccount));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        return General<String>(data: jsonData["data"]["token"]);
      }
      return General<String>(error: true);
    } on Exception catch (e) {
      return General<String>(error: true);
    }

  }
}
