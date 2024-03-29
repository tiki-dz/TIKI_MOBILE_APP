import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:tiki/Models/model.user.dart';
class LocalController{

  static final box = GetStorage();
  static setToken(String? token){
    box.write('token', token);
  }

  static String getToken(){
    return box.read("token") ??"";
  }

  static String getLang(){
    return box.read("lang") ??"";
  }

  static  setLang(String lang){
    box.write('lang', lang);
  }

  static logOut(){
    box.remove("token");
  }

  static setProfile(String? profile){
    box.write('profile', profile);
  }

  static setIdClient(int idClient){
    box.write('idClient', idClient);
  }
  static int getIdClient(){
    return box.read('idClient') ?? -1;
  }

  // 0 for login  , 1 for edit profile
  static UserModel getProfile(){
    var data = jsonDecode(box.read("profile"));
    return UserModel.fromJson(data["data"]["User"]);
  }

  // first time for onboarding
  static bool getFirst(){
    return box.read("first") ?? true ;
  }

  static setFirst(bool first){
    return box.write("first",first) ;
  }

  static bool getSign(){
    return box.read("token")==null ? false : true;
  }

}