import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tiki/Models/model.event.dart';
import 'package:tiki/controllers/purchaseController.dart';
import 'package:tiki/data/font.data.dart';
import 'package:tiki/views/Authentification/components/component.button.dart';
import 'package:tiki/views/payment/payment.dart';

import '../../data/pallete.data.dart';
import 'component/addPerson.dart';
import 'component/component.buttonPayer.dart';
import 'component/discountCode.dart';
import 'component/dottedLine.dart';
import 'component/priceDesc.dart';
import 'component/userWidgetModel.dart';

class PurchaseWidget extends StatefulWidget {
  PurchaseWidget({required this.event, Key? key}) : super(key: key);

  EventModel? event;

  @override
  _PurchaseWidgetState createState() => _PurchaseWidgetState();
}

class _PurchaseWidgetState extends State<PurchaseWidget> {
  final controller = Get.put(PurchaseController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.initEvent(widget.event);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: KOrange,
            appBar: AppBar(
              backgroundColor: KOrange,
              title: Text(
                "purshace".tr,
                style: TextStyle(fontSize: 13.sp),
              ),
              centerTitle: true,
              elevation: 0,
            ),
            body: Container(
              height: 100.h,
              width: 100.w,
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12.sp),
                    topLeft: Radius.circular(12.sp)),
              ),
              child: GetBuilder<PurchaseController>(
                  init: controller,
                  builder: (context) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 3.w),
                              height: 10.h,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10.sp)),
                              child: Center(
                                child: Text(
                                  controller.event?.name ?? "",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: controller.event?.nameSizePurchase()),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            InputDiscountCode(
                              hintText: 'Enter a discount code',
                              textEditingController:
                                  controller.discountCodeController,
                              submit: controller.submit,
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "Achter pour :",
                              style: TextStyle(
                                  fontSize: 11.sp, fontWeight: semiBold),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Wrap(
                              direction: Axis.horizontal,
                              children: [
                                userModelWidget(),
                                addPerson(controller.persons[0], 0),
                                addPerson(controller.persons[1], 1),
                                addPerson(controller.persons[2], 2),
                              ],
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            controller.checking
                                ? const Center(
                                    child: CircularProgressIndicator(
                                    color: KOrange,
                                  ))
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Summary :",
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: semiBold),
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 1.h, horizontal: 4.w),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(6.sp),
                                            color: const Color(0xFFFAFAFA)),
                                        child: Column(
                                          children: [
                                            priceDesc(
                                                "prix unitaire",
                                                controller.priceOneBefore
                                                        .toString() +
                                                    " " +
                                                    "DA"),
                                            dottedLine,
                                            priceDesc(
                                                "places",
                                                controller.places.toString() +
                                                    " place"),
                                            dottedLine,
                                            priceDesc(
                                                "prix total",
                                                controller.priceAllBefore
                                                        .toString() +
                                                    " " +
                                                    "DA"),
                                            Visibility(
                                              visible:
                                                  controller.enableDiscountCode,
                                              child: Column(
                                                children: [
                                                  priceDesc(
                                                      "réduction",
                                                      controller.reduction
                                                              .toString() +
                                                          " " +
                                                          "DA"),
                                                  dottedLine,
                                                  priceDesc(
                                                      "prix unitaire après",
                                                      controller.priceOneAfter
                                                              .toString() +
                                                          " " +
                                                          "DA"),
                                                  dottedLine,
                                                  priceDesc(
                                                      "prix total après",
                                                      controller.priceAllAfter
                                                              .toString() +
                                                          " " +
                                                          "DA"),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                          ],
                        ),
                        Visibility(
                            visible: !controller.checking,
                            child: controller.purchasing? const CircularProgressIndicator(color: KOrange,): buttonPayer(
                                "Payer",
                                controller.enableDiscountCode
                                    ? controller.priceAllAfter
                                    : controller.priceAllBefore,
                                ()async {
                                 await controller.purchase();
                                }))
                      ],
                    );
                  }),
            )));
  }
}
