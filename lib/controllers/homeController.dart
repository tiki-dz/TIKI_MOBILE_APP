import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tiki/Models/model.categoris.dart';
import 'package:tiki/Models/model.event.dart';
import 'package:tiki/controllers/filterController.dart';

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

  //for pagination
  List<bool> isGetting = [];
  List<CategoryModel> categories = [];
  List<int> pages = [];
  List<bool> haveNext = [];
  List<List<EventModel>> eventsPagination = [];
  int categoriesNumber = 0;
  late int selected;

  late int momentSelected;

  List<EventModel> eventsCategory = [];

  List<Map<String, List<EventModel>>> events = [];

  bool processing = false;

  bool error = false;

  ScrollController scrollController = ScrollController();

  var animation = 1.0.obs;

  final double _constRadius = 12;
  double opacity = 12;
  double radiusContainer = 12;

  initAnimation() {
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
      categories = response.data ?? [];
      categoriesNumber = categories.length;
    } else {
      error = true;
    }
  }

  getEventsCategories(String category, int page, bool pagination) async {
    if (pagination) {
      isGetting[momentSelected] = true;
      page++;
      update();
    }
    var response = await HomeService.getEventsCategories(category, page);
    if (pagination) {
      eventsPagination[momentSelected].addAll(response.data ?? []);
      haveNext[momentSelected] = response.haveNext;
      pages[momentSelected]++;
      isGetting[momentSelected] = false;
      update();
    } else {
      if (!response.error) {
        eventsCategory = response.data ?? [];
        eventsPagination.add(eventsCategory);
        pages.add(0);
        haveNext.add(response.haveNext);
        isGetting.add(false);
      } else {
        error = true;
      }
    }
  }

  // preparation of filter ( catogries )
  preparationFilter(){
    final controller=  Get.put(FilterController());
    List<CategoryModel> categoriesFilter = [];
    categoriesFilter.addAll(categories);
    categoriesFilter.insert(0, CategoryModel(id: -1, name: "All", description: "", icon: ""));
    controller.categories = categoriesFilter;
    controller.category = controller.categories[0];
  }

  getEvents() async {
    switchBool();
    update();
    await getCategories();
    if (!error) {
      for (var category in categories) {
        await getEventsCategories(category.id.toString(), 0, false);
        if (!error) {
          if (eventsCategory.isNotEmpty) {
            Map<String, List<EventModel>> map = {};
            map[category.name] = eventsCategory;
            events.add(map);
            eventsCategory = [];
            processing = false;
            update();
          }
        }
      }
    }
    preparationFilter();
  }

  toCategory(String category) {
    selected = categories.indexOf(categories.where((element) => element.name==category).toList().first);
    momentSelected = selected;
    Get.to(() => CategoriesWidget(
      selected: selected,
    ));
  }

  //pagination
  updateSelected(int index) {
    selected = index;
    update();
  }

  currentList() {
    return eventsPagination[selected];
  }

  currentLength() {
    return eventsPagination[selected].length;
  }

  CategoryModel currentCategory() {
    return categories[selected];
  }

  currentEvent(index) {
    return eventsPagination[selected][index];
  }

  currentIsEmpty() {
    return eventsPagination[selected].isEmpty;
  }

  bool currentHaveNext() {
    return haveNext[selected];
  }

  currentPage() {
    return pages[selected];
  }

  currentGetting() {
    return isGetting[selected];
  }

  getNextPageEvents() async {
    momentSelected = selected;
    await getEventsCategories(
        currentCategory().id.toString(), currentPage(), true);
  }


  clean(){
    isGetting = [];
    pages = [];
    eventsPagination = [];
    events = [];
    haveNext =[];
    categories = [];
  }

  refr()async{
    clean();
    await getEvents();
  }
}

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
