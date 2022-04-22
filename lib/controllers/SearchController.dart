import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tiki/Models/model.event.dart';
import 'package:tiki/services/SearchService.dart';

class SearchController extends GetxController{
  late FocusNode focusNode;

  TextEditingController searchController = TextEditingController();
  List<EventModel> events = [];


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
      update();
    }else {
      await getEvents();
    }
  }

  getEvents() async {
    page == 0 ? isFetching = true : isFetchingPage = true;
    update();

    var response = await SearchService.getSearchEvents(page,filterSearch);
    if (!response.error) {
      if (page == 0) {
        events = [];
      }
      events.addAll(response.data ?? []);
      haveNext = response.haveNext;
      if (haveNext) {
        ++page;
      }
      isFetching ? isFetching = false : isFetchingPage = true;
    }
    update();
  }

}