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

  // 0 for login  , 1 for edit profile
  static UserModel getProfile(){
    var data = jsonDecode(box.read("profile"));
    return UserModel.fromJson(data["data"]["User"]);
  }

}