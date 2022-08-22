import 'dart:convert';
import 'package:get/get.dart';
import 'package:tiki/Models/model.city.dart';
import 'package:tiki/Models/model.registration.dart';
import 'package:tiki/controllers/localController.dart';
import 'package:tiki/data/server.data.dart';
import 'package:http/http.dart' as http;
import '../data/server.data.dart';
import 'general/general.dart';

class AuthService {
  static Future<General<String>> login(
      String email, String password, String tokenNotification) async {
    try {
      http.Response response = await http.post(Uri.parse(urlLogin), body: {
        "email": email,
        "password": password,
        "fcm_token": tokenNotification
      });
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        return General<String>(
            data: response.body, token: jsonData["data"]["token"]);
      }
      return General<String>(data: "", error: true);
    } on Exception catch (e) {
      print(e);
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
        "phoneNumber": registration.phoneNumber,

      });

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        return General<String>(data: jsonData["data"]["token"]);
      } else if (response.statusCode == 409) {
        return General<String>(
            data: "", error: true, errorMessage: "account_exist".tr);
      } else if (response.statusCode == 422) {
        return General<String>(
            data: "", error: true, errorMessage: "check_informations".tr);
      }
      return General<String>(data: "", error: true, errorMessage: "try".tr);
    } on Exception catch (e) {
      return General<String>(data: "", error: true, errorMessage: "try".tr);
    }
  }

  static Future<General<String>> verifyCode(
      String email, String? token, String code,String tokenNot) async {
    try {
      http.Response response = await http.post(Uri.parse(urlVerifyCode),
          headers: {'x-access-token': token ?? ""},
          body: {'email': email, 'code': code,"fcm_token": tokenNot});
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

  static Future<General<String>> resendVerification(
      String email, String password) async {
    try {
      http.Response response = await http.post(
          Uri.parse(urlResendVerificationCode),
          body: {'email': email, 'password': password});
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        return General<String>(data: jsonData["data"]["token"]);
      }
      if (response.statusCode == 422) {
        return General<String>(error: true, errorMessage: "invalid data");
      }
      if (response.statusCode == 404) {
        return General<String>(
            error: true, errorMessage: "acount doesn t exist");
      }
      return General<String>(data: "", error: true);
    } on Exception catch (e) {
      return General<String>(data: "", error: true);
    }
  }

  static Future<General<String>> forgetPasswordSendVerificationAccount(
      String email, String? token) async {
    try {
      http.Response response = await http.post(
          Uri.parse(urlForgetPasswordSendVerificationAccount),
          headers: {'x-access-token': token ?? ""},
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
      String email, String password, String? token) async {
    try {
      http.Response response = await http.put(
          Uri.parse(urlForgetPasswordChangePasswordAccount),
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

  static Future<General<String>> getProfile() async {
    try {
      http.Response response = await http.get(
          Uri.parse(urlProfile),
          headers: {'x-access-token':LocalController.getToken()  });
      if (response.statusCode == 200) {

        return General<String>(data: response.body);
      }
      return General<String>(data: "", error: true);
    } on Exception catch (e) {
      return General<String>(data: "", error: true);
    }
  }

  static Future<General<List<CityModel>>> getCities() async {
    try {
      http.Response response = await http.get(
          Uri.parse(urlCities));

      if (response.statusCode == 200) {
        List<CityModel> cities = [];
        var jsonData = jsonDecode(response.body);
        var data = jsonData["data"];
        cities.add(CityModel(id: -1, name: "Wilaya"));
        for(var item in data){
          cities.add(CityModel.fromJson(item));
        }
        return General<List<CityModel>>(data: cities);
      }
      return General<List<CityModel>>( error: true);
    } on Exception catch (e) {
      return General<List<CityModel>>( error: true);
    }
  }
}
