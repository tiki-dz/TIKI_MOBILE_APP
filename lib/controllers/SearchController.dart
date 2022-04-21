import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchController extends GetxController{
  late FocusNode focusNode;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    focusNode = FocusNode();
    showKeyboard();
  }
  void showKeyboard() {
    focusNode.requestFocus();
  }
}