import '../controllers/localController.dart';
import '../data/server.data.dart';
import 'general/general.dart';
import 'package:http/http.dart' as http;

class EventService{
  static Future<General<bool>> getCategories(int idEvent) async {
    var user = LocalController.getProfile();
    try {
       await http.post(Uri.parse(saveEvent),body: {
         {
           "idEvent":idEvent,
           "idClient":user.idClient
         }
       });
      return General<bool>(error: true);
    } on Exception catch (e) {
      return General<bool>(error: true);
    }
  }
}