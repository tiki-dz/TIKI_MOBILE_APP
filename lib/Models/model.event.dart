import '../data/const.dart';
import 'package:sizer/sizer.dart';
class EventModel {
  int id;
  String name;
  String description;
  String price;
  String organiser;
  String address;
  String eventImage;
  String ticketImage;
  DateTime startDate;
  DateTime endDate;
  int ticketNb;

  EventModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.organiser,
      required this.address,
      required this.eventImage,
      required this.ticketImage,
      required this.ticketNb,
      required this.startDate,
      required this.endDate,
      required this.price});

  factory EventModel.fromJson(Map<String, dynamic> item) {
    return EventModel(
        price: item["price"] == null ? "2300" : item["price"].toString(),
        id: item["idEvent"],
        name: item["name"],
        description: item["description"],
        organiser: item["organiser"],
        address: item["address"],
        eventImage: item["eventImage"],
        ticketImage: item["ticketImage"],
        ticketNb: item["ticketNb"],
        startDate: DateTime.parse(item["startDate"]),
        endDate: DateTime.parse(item["endDate"]));
  }

  String startDateFormat() {
    return startDate.weekday.toString() +
        ", " +
        monthsAn[startDate.month] +
        " " +
        startDate.day.toString() +
        ", " +
        startDate.year.toString();
  }

  String nameHome(){
    var length = name.length;
    return length > 20 ? (name).substring(0,16)+"..." : name ;
  }
  String nameDetailEvent(){
    var length = name.length ;
    return length > 20 ? name.substring(0,20)+"..." : name ;
  }

  double nameSizePurchase(){
    var length = name.length ;
    return length > 20 ? 10.sp :13.sp;
  }


  @override
  String toString() {
    return 'EventModel{id: $id, name: $name, description: $description, organiser: $organiser, address: $address, eventImage: $eventImage, ticketImage: $ticketImage, startDate: $startDate, endDate: $endDate, ticketNb: $ticketNb}';
  }
}
