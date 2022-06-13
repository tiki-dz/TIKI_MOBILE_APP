import 'package:get/get.dart';
import 'package:tiki/Models/model.purchase.dart';
import 'package:tiki/services/PurchiseService.dart';
import 'package:tiki/services/TicketService.dart';

class TicketsController extends GetxController {

  var selected = 0.obs;
  List<PurchaseModel> ticketsHistory = [];
  List<PurchaseModel> ticketsNext= [];

  updateSelected(int cas) {
    selected.value = cas;
  }

  getTickets() async {
    var response = await TicketService.getTickets();
    if (!response.error) {
     var tickets = response.data ?? [];
     ticketsHistory = tickets.where((element) => element.event.startDate.isBefore(DateTime.now())).toList();
     ticketsNext = tickets.where((element) => element.event.startDate.isAfter(DateTime.now())).toList();
    }
  }
}
