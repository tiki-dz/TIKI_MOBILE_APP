import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tiki/Models/model.categoris.dart';
import 'package:tiki/constWidgets/snackBar.dart';
import 'package:tiki/controllers/SearchController.dart';
import 'package:tiki/controllers/homeController.dart';

class FilterController extends GetxController{



  late RxString fromDateController = "".obs;
  late RxString toDateController  = "".obs;
  late DateTime fromDate ;
  late DateTime toDate ;

  List<CategoryModel> categories = [];
  late CategoryModel category ;


  @override
  void onInit(){
    super.onInit();
    changeFromDate(DateTime.now());
    changeToDate(DateTime.now().add(const Duration(days: 30)));

  }



  RangeValues values = const RangeValues(0, 5000);

  changeSliderValue( value){
    values = value;
    update();
  }

  updateCategory(CategoryModel? category){
    this.category = category?? CategoryModel(id: 1, name: "", description: "", icon: "");
    update();
  }



  void changeFromDate(DateTime dateTime ) {
    fromDate = dateTime;
    final DateTime date = dateTime;
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(date);
    fromDateController.value = formatted.toString();
  }
  void changeToDate(DateTime dateTime ) {
    toDate= dateTime;
    final DateTime date = dateTime;
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(date);
    toDateController.value = formatted.toString();
  }

  String? validateFromDate(String? date){
      if(fromDateController.isEmpty){
        return "birthdate_req".tr;
      }
    return null;
  }

  String? validateToDate(String? date){
      if(toDateController.isEmpty){
        return "birthdate_req".tr;
      }
    return null;
  }


  void filter(){
    if(fromDate.isAfter(toDate)){
      snackBarModel("echec", "check_informations".tr, true);
      return ;
    }
    final controller = Get.find<SearchController>();
    controller.filter(fromDate,toDate,values.start.toInt(),values.end.toInt(),category.name);
    Get.back();
  }




}