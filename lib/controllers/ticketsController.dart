import 'package:get/get.dart';
import 'package:tiki/Models/model.purchase.dart';
import 'package:tiki/controllers/localController.dart';
import 'package:tiki/services/PurchiseService.dart';
import 'package:tiki/services/TicketService.dart';

class TicketsController extends GetxController {

  var selected = 0.obs;
  List<PurchaseModel> ticketsHistory = [];
  List<PurchaseModel> ticketsNext= [];
  bool gettingData = false;

  switchBool(){
    gettingData = !gettingData;
    update();
  }
  updateSelected(int cas) {
    selected.value = cas;
    update();
  }

  getTickets() async {
    if(LocalController.getSign()){
      switchBool();
      var response = await TicketService.getTickets();
      if (!response.error) {
        var tickets = response.data ?? [];
        ticketsHistory = tickets.where((element) => element.event.startDate.isBefore(DateTime.now())).toList();
        ticketsNext = tickets.where((element) => element.event.startDate.isAfter(DateTime.now())).toList();
      }
      switchBool();
    }else{
      ticketsHistory =[];
      ticketsNext = [];
    }

  }

  List<PurchaseModel> currentList(){
    return   selected.value ==0 ? ticketsNext : ticketsHistory;
  }


}
