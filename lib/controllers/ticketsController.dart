import 'package:get/get.dart';

class TicketsController extends GetxController{
  var selected = 0.obs;

  updateSelected(int cas ){
    selected.value = cas;
  }
}