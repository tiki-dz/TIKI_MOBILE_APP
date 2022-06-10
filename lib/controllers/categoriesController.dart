import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiki/Models/model.categoris.dart';

class CategoriesController extends GetxController{
  late List<CategoriesModel> categories ;
  late int selected ;

  CategoriesController({required this.categories, required this.selected});
  updateSelected (int index){
    selected = index;
    update();
  }
}