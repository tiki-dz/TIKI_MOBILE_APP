import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiki/views/Authentification/widget.login.dart';
import 'package:tiki/views/payment/purshace.dart';

import '../../Models/model.event.dart';
import '../../controllers/wrapperProfileController.dart';

class WrapperPurchase extends StatelessWidget {
   WrapperPurchase({required this.event,Key? key}) : super(key: key);

  EventModel? event;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WrapperProfileController());
    return GetBuilder<WrapperProfileController>(
        init: controller,
        builder: (_) =>
        controller.sign ?  PurchaseWidget(event: event) : LogInWidget());
  }
}
