import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tiki/Models/model.event.dart';
import 'package:tiki/Models/model.person.dart';
import 'package:tiki/services/PurchiseService.dart';
import 'package:tiki/views/payment/payment.dart';

import '../Models/model.user.dart';
import '../constWidgets/snackBar.dart';
import 'localController.dart';

class PurchaseController extends GetxController {


  late EventModel? event;

  bool enableDiscountCode = false;
  int places = 1;
  double  priceOneBefore = 1200;
  double  priceAllBefore = 1200;
  double  priceOneAfter = 1200;
  double  priceAllAfter = 1200;
  double  reduction = 0;

  initEvent(EventModel? event) {
    this.event = event;
    priceOneBefore =double.parse(event?.price??"3");
    priceOneAfter =double.parse(event?.price??"3");
    priceAllBefore =double.parse(event?.price??"3");
  }

  late UserModel userProfile = LocalController.getProfile();

  TextEditingController discountCodeController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();


  String giveName(){
    return userProfile.firstName[0] + "." + userProfile.lastName;
  }

  List<PersonModel?> persons = [null, null, null];

  String? validateName(String? name) {
    if (firstNameController.text.isEmpty) {
      return "name_req".tr;
    }

    if (firstNameController.text.length < 2) {
      return "name_valid".tr;
    }
    return null;
  }

  String? validateLastName(String? name) {
    if (validateName("") == null) {
      if (lastNameController.text.isEmpty) {
        return "last_name_req".tr;
      }

      if (lastNameController.text.length < 2) {
        return "last_name_valid".tr;
      }
    }
    return null;
  }

  String? validatePhone(String? phone) {
    if (validateName("") == null && validateLastName("") == null) {
      if (phoneController.text.isEmpty) {
        return "phone_num_req";
      }
      if(phoneController.text[0] != "0"){
        return "phone_num_req";
      }
    }
    return null;
  }

  initControllers(int index) {
    lastNameController.text = persons[index]?.lastName ?? "";
    firstNameController.text = persons[index]?.firstName ?? "";
    phoneController.text = persons[index]?.phoneNumber ?? "";
  }

  clearControllers() {
    firstNameController.clear();
    lastNameController.clear();
    phoneController.clear();
  }

  addPersonOrEdit(int index) {
    if (formKey.currentState?.validate() ?? true) {
      persons.removeAt(index);
      persons.insert(
          index,
          PersonModel(
              firstName: firstNameController.text,
              lastName: lastNameController.text,
              phoneNumber: phoneController.text));
      clearControllers();
      calculate();
      Get.back();
      update();
    }
  }

  deletePerson(int index) {
    if (formKey.currentState?.validate() ?? true) {
      persons.removeAt(index);
      persons.insert(index, null);
      clearControllers();
      calculate();
      Get.back();
      update();
    }
  }

  //////// code promo



  bool checking = false;

  switchChecking(){
    checking = !checking;
    update();
  }

  deleteDiscountCode(){
    enableDiscountCode = false;
    discountCodeController.clear();
    update();
  }

  calculate() {
    places = 1;
    for (int i = 0; i < persons.length; ++i) {
      if (persons[i] != null) {
        ++places;
      }
    }
    priceAllBefore = priceOneBefore * places;
    priceAllAfter = priceOneAfter + priceOneBefore * (places -1 ) ;
    reduction = priceOneAfter - priceOneBefore;
    update();
  }

  String? submit(String? name) {
    checkDiscountCode();
    return null;
  }

  //call service to check code promo
  checkDiscountCode()async {
    if(discountCodeController.text.isNotEmpty){
      switchChecking();
      var response = await PurchaseService.checkDiscountCode(discountCodeController.text, priceOneBefore);
      if(response.error){
        snackBarModel("echec".tr, "code promo n'existe pas", true);
      }else{
        enableDiscountCode = true;
        priceOneAfter = double.parse(response.data ??"");
        calculate();
        snackBarModel("succes".tr, "code promo activé", false);
      }
      switchChecking();
    }
  }
  ////purchasing
  bool purchasing = false;

  switchPurchasing(){
    purchasing = !purchasing;
    update();
  }


  purchase()async {
    switchPurchasing();

    var data=[];
    for (int i = 0; i < persons.length; ++i) {
      if (persons[i] != null) {
        data.add({"firstName":persons[i]?.firstName??"","lastName":persons[i]?.lastName??"","phoneNumber":persons[i]?.phoneNumber??""});
      }
    }

    var response = await PurchaseService.purchase(data,event,enableDiscountCode , discountCodeController.text);
    if(response.error){
      snackBarModel("echec".tr, "try".tr, true);
    }else{
      Get.to(()=>PaymentWebView(url: response.data));
    }
    switchPurchasing();

  }

}
