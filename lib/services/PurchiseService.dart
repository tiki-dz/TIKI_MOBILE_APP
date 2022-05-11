
import 'package:mime/mime.dart';
import 'package:tiki/Models/model.event.dart';
import 'package:tiki/Models/model.user.dart';
import 'package:tiki/Models/model.registration.dart';
import 'package:tiki/controllers/localController.dart';
import 'package:tiki/data/server.data.dart';
import 'package:http/http.dart' as http;

import 'general/general.dart';

import 'package:http_parser/http_parser.dart';
import 'dart:convert';

class PurchaseService {
  static Future<General<String>> checkDiscountCode(String name , double price) async {
    Map<String, String?> body ={
      'name': name,
      'price': price.toStringAsFixed(0)
    };
    try {
      http.Response response = await http.post(Uri.parse(urlCheckCode),body: body);
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        return General<String>(data:jsonData["data"]["newPrice"].toString());
      }
      return General<String>(error: true);
    } on Exception catch (e) {
      return General<String>(error: true);
    }
  }
  static Future<General<String>> purchase(var data , int idClient , EventModel? event) async {
    Map<String, dynamic> body ={
      "data": data,
      "event": {"id":event?.id,"name":event?.name,"price":event?.price},
      "idClient": idClient,
    };
    var header = {
      'Accept': 'application/json',
      'Content-type': 'application/json',

    };
    try {
      http.Response response = await http.post(Uri.parse(urlPurchase),headers: header,body:json.encode(body));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        return General<String>(data:jsonData["url"].toString());
      }
      return General<String>(error: true);
    } on Exception catch (e) {
      return General<String>(error: true);
    }
  }
}
