import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tiki/Models/model.event.dart';
import 'package:tiki/services/SearchService.dart';

class SearchController extends GetxController{
  late FocusNode focusNode;
  List<EventModel> events = [];
  List<EventModel> fullEvents = [];
  bool isFetching = false;
  bool isFetchingPage = false;
  bool haveNext = false;
  int page = 0;
  String filterSearch = "";

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

  onSubmit(String search)async {
    filterSearch = search;
    if(search.isEmpty){
      events =[];
      fullEvents = [];
      update();
    }else {
      await getEvents();
    }
  }

  filter(DateTime fromDate,DateTime toDate , int startPrice , int endPrice , String category){
    events = fullEvents.where((event) =>
      event.startDate.isAfter(fromDate) && event.startDate.isBefore(toDate) &&
        int.parse(event.price) > startPrice && int.parse(event.price) < endPrice && (category =="All"|| category == event.category)
    ).toList();
    update();
  }

  getEvents() async {
    page == 0 ? isFetching = true : isFetchingPage = true;
    update();

    var response = await SearchService.getSearchEvents(page,filterSearch);
    if (!response.error) {
      if (page == 0) {
        fullEvents  = [];
      }
      fullEvents.addAll(response.data ?? []);
      events = fullEvents;
      haveNext = response.haveNext;
      if (haveNext) {
        ++page;
      }
      isFetching ? isFetching = false : isFetchingPage = true;
    }
    update();
  }

}