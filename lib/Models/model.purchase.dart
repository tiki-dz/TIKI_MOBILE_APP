import 'package:tiki/Models/model.event.dart';

import 'model.Ticket.dart';

class PurchaseModel {
  int id;
  int idClient;
  int idEvent;
  int nbTickets;
  EventModel event;
  List<TicketModel> tickets;

  PurchaseModel(
      {required this.event,
        required this.id,
        required this.idClient,
        required this.idEvent,
        required this.nbTickets,
        required this.tickets});

  factory PurchaseModel.fromJson(Map<String, dynamic> item) {
    List<TicketModel> tickets = [];
    for (var sousItem in item["MultipleTickets"]) {
      tickets.add(TicketModel.fromJson(sousItem));
    }
    return PurchaseModel(
        id: item["idPurchase"],
        event: EventModel.fromJson(item["event"]["data"]),
        idClient: item["idClient"],
        idEvent: item["idEvent"],
        nbTickets: item["nbTickets"],
        tickets: tickets);
  }
}
