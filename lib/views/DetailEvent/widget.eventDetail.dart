import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:tiki/controllers/detailEventController.dart';
import 'package:tiki/data/font.data.dart';
import 'package:tiki/data/pallete.data.dart';
import 'package:tiki/views/DetailEvent/widget.comments.dart';
import 'package:get/get.dart';
import 'package:tiki/views/Wrapper/widget.wrapperPurchase.dart';
import 'package:tiki/views/payment/purshace.dart';
import '../../Models/model.event.dart';
import 'component/component.button.dart';
import 'component/component.buttonSave.dart';
import 'component/component.info.dart';
import 'package:cached_network_image/cached_network_image.dart';
class EventDetailWidget extends StatefulWidget {
  EventDetailWidget({required this.event, Key? key}) : super(key: key);
  EventModel? event;

  @override
  _EventDetailWidgetState createState() => _EventDetailWidgetState();
}

class _EventDetailWidgetState extends State<EventDetailWidget> {

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Get.find<DetailEventController>().dispose();
  }
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DetailEventController());
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 30.h,
                child: CachedNetworkImage(
                  imageUrl: widget.event?.eventImage ?? "",
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Image.asset('assets/logo/logo.png',fit: BoxFit.fill,),
                  errorWidget: (context, url, error) =>  Image.asset('assets/icons/default.jpg',fit: BoxFit.fill,),
                  fit: BoxFit.fill,
                ),
              ),
              const Expanded(child: SizedBox())
            ],
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: SizedBox(
                  height: 25.h,
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: SvgPicture.asset(
                            "assets/icons/goBackEventDetail.svg"),
                      )),
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(13.sp),
                          topLeft: Radius.circular(13.sp))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.event?.nameDetailEvent()??"",
                              style: TextStyle(
                                  fontSize: 18.sp, fontWeight: semiBold),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 3.w),
                              child: SvgPicture.asset("assets/icons/share.svg"),
                            ),
                          ],
                        ),
                        eventInfoMode(
                          widget.event?.startDateFormat() ?? "",
                          "12:00 AM - 12:00 PM",
                          "eventCalandrier",
                        ),
                        eventInfoMode(
                          "Algeria, Oran",
                          "Cinéma centrale",
                          "eventPlace",
                        ),
                        eventInfoMode(
                          widget.event?.price??""+" da",
                          "par place",
                          "eventTicket",
                        ),
                        SizedBox(
                          height: 0.5.h,
                        ),
                        const CommentEventWidget(),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          "About",
                          style:
                              TextStyle(fontSize: 13.sp, fontWeight: semiBold),
                        ),
                        Expanded(
                            child: SingleChildScrollView(
                          child: Text(
                            widget.event?.description ?? "",
                            style: TextStyle(fontSize: 10.sp),
                          ),
                        )),
                        Row(
                          children: [
                            Expanded(
                              child: buttonBuyEvent("buy_ticket".tr,  "gishet", () {
                                Get.to(()=>WrapperPurchase(event: widget.event,));
                                controller.saveOrUnSaved();
                              }),
                            ),
                            SizedBox(width: 2.w,),
                            buttonSaveEvent(),
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
