import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tiki/Models/model.categoris.dart';
import 'package:tiki/Models/model.event.dart';

import '../services/HomeService.dart';

class HomeController extends GetxController{

  List<CategoriesModel>? categories;
  int? categoriesNumber ;

  List<EventModel>? eventsCategory;

  List<Map<String,List<EventModel>?>>? events =[];

  bool processing = false;

  bool error = false;

  late AnimationController animationController ;

  ScrollController scrollController = ScrollController();

  var animation = 0.0.obs;



  iniAnimation(TickerProvider tickerProvider){
    animationController = AnimationController(vsync: tickerProvider,duration: const Duration(seconds: 1));
    animationController.addListener(() {
      animation.value = animationController.value;
    });
    scrollController.addListener(() {
      if(scrollController.offset > 20){
        animationController.forward();
      }
    });
  }



  switchBool(){
    processing = !processing;
  }


  getCategories() async {
    var response = await HomeService.getCategories();
    if (!response.error){
      categories = response.data;
      categoriesNumber = categories?.length;
    } else{
      error = true;
    }
  }
  
  getEventsCategories(String category)async {
    var response = await HomeService.getEventsCategories(category);
    if(!response.error){
      eventsCategory = response.data;
    } else{
      error = true;
    }
  }

  getEvents()async {
    switchBool();
    await getCategories();
    if(!error){
      for(var category in categories!){
        await getEventsCategories(category.name);
        if(!error){
          if(eventsCategory?.isNotEmpty?? false){
            Map<String,List<EventModel>?> map = {};
            map[category.name] =eventsCategory;
            events?.add(map);
            eventsCategory =[];
            update();
          }
        }
      }
    }
    switchBool();
  }


}