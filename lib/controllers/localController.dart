import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:tiki/Models/model.user.dart';
class LocalController{

  static final box = GetStorage();
  static setToken(String? token){
    box.write('token', token);
  }

  static String getToken(){
    return box.read("token");
  }
  static setProfile(String? profile){
    box.write('profile', profile);
  }

  static UserModel getProfile(){
    var data = jsonDecode(box.read("profile"));
    return UserModel.fromJson(data["data"]["account"]["User"]);
  }

}