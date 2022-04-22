import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FilterController extends GetxController{

  late RxString fromDate = RxString("");
  late RxString toDate = RxString("");

  RangeValues values = RangeValues(400, 1200);

  changeSliderValue( value){
    values = value;
    update();
  }

  void changeFromDate(DateTime dateTime ) {
    final DateTime date = dateTime;
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(date);
    fromDate.value = formatted.toString();
  }
  void changeToDate(DateTime dateTime ) {
    final DateTime date = dateTime;
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(date);
    toDate.value = formatted.toString();
  }
}