import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tiki/Models/model.categoris.dart';
import 'package:tiki/Models/model.event.dart';

import '../services/HomeService.dart';
import '../views/Home/categories/widget.categories.dart';

class HomeController extends GetxController {
  @override
  void onInit() async {

    getEvents();

    super.onInit();
  }

  @override
  void onReady() async {
    initAnimation();
    super.onInit();
  }


  List<CategoriesModel>? categories;
  int? categoriesNumber;

  List<EventModel>? eventsCategory;

  List<Map<String, List<EventModel>?>>? events = [];

  bool processing = false;

  bool error = false;



  ScrollController scrollController = ScrollController();

  var animation = 1.0.obs;

  /*iniAnimation(TickerProvider tickerProvider) {
    animationController = AnimationController(
        vsync: tickerProvider, duration: const Duration(seconds: 1));
    animationController.addListener(() {
      animation.value = 1 - animationController.value;
    });
    scrollController.addListener(() {
      if (scrollController.offset > 20) {
        animationController.forward();
        animation.value = 1 - animationController.value;
      }
    });
  }*/

  final double _constRadius = 12;
  double opacity = 12;
  double radiusContainer = 12;

  initAnimation(){
    scrollController.addListener(onListen);
  }
  void onListen() {
    setRadiusContainer();
  }

  setRadiusContainer() {
    if (radiusContainer < 0.5) {
      radiusContainer = 0;
      opacity = radiusContainer;
    } else if (250 / (scrollController.offset) > _constRadius) {
      radiusContainer = _constRadius;
      opacity = radiusContainer;
    } else {
      radiusContainer = 250 / (scrollController.offset);
      opacity = radiusContainer;
    }
    if (scrollController.offset == 0.0) {
      radiusContainer = 12;
      opacity = radiusContainer;
    }
  update();
  }

  switchBool() {
    processing = !processing;
  }

  getCategories() async {
    var response = await HomeService.getCategories();
    if (!response.error) {
      categories = response.data;
      categoriesNumber = categories?.length;
    } else {
      error = true;
    }
  }

  getEventsCategories(String category) async {
    var response = await HomeService.getEventsCategories(category);
    if (!response.error) {
      eventsCategory = response.data;
    } else {
      error = true;
    }
  }

  getEvents() async {
    switchBool();
    update();
    await getCategories();
    if (!error) {
      for (var category in categories!) {
        await getEventsCategories(category.name);
        if (!error) {
          if (eventsCategory?.isNotEmpty ?? false) {
            Map<String, List<EventModel>?> map = {};
            map[category.name] = eventsCategory;
            events?.add(map);
            eventsCategory = [];

            processing=false;
            update();
          }
        }
      }
    }



  }

  toCategory(int index) {
    Get.to(() => CategoriesWidget(
          categories: categories ?? [],
          selected: index,
        ));
  }
}
