import 'package:tiki/Models/model.categoris.dart';
import 'package:http/http.dart' as http;
import 'package:tiki/Models/model.event.dart';
import 'package:tiki/Models/model.purchase.dart';
import '../Models/model.user.dart';
import '../controllers/localController.dart';
import '../data/server.data.dart';
import 'general/general.dart';
import 'dart:convert';

class TicketService {
  static Future<General<List<PurchaseModel>>> getTickets() async {
    var user = LocalController.getProfile();
    try {

      http.Response response =
      await http.get(Uri.parse(urlTickets + "/${user.idClient}/purchases"));
      print(response.body);
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        List<PurchaseModel> purchases = [];
        var data = jsonData["data"];
        for (var item in data) {
          purchases.add(PurchaseModel.fromJson(item));
        }
        return General<List<PurchaseModel>>(data: purchases);
      }
      return General<List<PurchaseModel>>(error: true);
    } on Exception catch (e) {
      print(e);
      return General<List<PurchaseModel>>(error: true);
    }
  }
}
