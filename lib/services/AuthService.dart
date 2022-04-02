import 'dart:convert';
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
      return General<String>(data: "", error: true);
    } on Exception catch (e) {
      return General<String>(data: "", error: true);
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
      return General<String>(data: "", error: true);
    } on Exception catch (e) {
      return General<String>(data: "", error: true);
    }
  }

  static Future<General<String>> verifyCode(
      String email, String? token, String code) async {
    try {
      http.Response response = await http.post(Uri.parse(urlVerifyCode),
          headers: {'x-access-token': token ?? ""},
          body: {'email': email, 'code': code});
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        return General<String>(
            data: response.body, token: jsonData["data"]["token"]);
      }
      return General<String>(data: "", error: true);
    } on Exception catch (e) {
      return General<String>(data: "", error: true);
    }
  }

  static Future<General<String>> forgetPasswordValidateAccount(
      String email, String? token, String code) async {
    try {
      http.Response response = await http.post(
          Uri.parse(urlForgetPasswordValidateAccount),
          headers: {'x-access-token': token ?? ""},
          body: {'email': email, 'code': code});
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        return General<String>(data: jsonData["data"]["token"]);
      }
      return General<String>(data: "", error: true);
    } on Exception catch (e) {
      return General<String>(data: "", error: true);
    }
  }

  static Future<General<String>> forgetPasswordSendVerificationAccount(
      String email) async {
    try {
      http.Response response = await http.post(
          Uri.parse(urlForgetPasswordSendVerificationAccount),
          body: {"email": email});
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        return General<String>(data: jsonData["data"]["token"]);
      }
      return General<String>(data: "", error: true);
    } on Exception catch (e) {
      return General<String>(data: "", error: true);
    }
  }

  static Future<General<String>> forgetPasswordChangePasswordAccount(
      String email, String password , String? token) async {
    try {
      http.Response response =
          await http.put(Uri.parse(urlForgetPasswordChangePasswordAccount),
              headers: {'x-access-token': token ?? ""},
              body: {'email': email, 'password': password});
      if (response.statusCode == 200) {
        return General<String>(data: "");
      }
      return General<String>(data: "", error: true);
    } on Exception catch (e) {
      return General<String>(data: "", error: true);
    }
  }
}
