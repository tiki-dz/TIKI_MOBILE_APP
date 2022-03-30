import 'package:tiki/Models/model.user.dart';
import 'package:tiki/controllers/localController.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController{
  late UserModel userProfile = LocalController.getProfile();

}