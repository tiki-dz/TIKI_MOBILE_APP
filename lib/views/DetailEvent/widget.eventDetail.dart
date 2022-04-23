import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:tiki/data/font.data.dart';
import 'package:tiki/views/DetailEvent/widget.comments.dart';
import 'package:get/get.dart';
import '../../Models/model.event.dart';
import 'component/component.button.dart';
import 'component/component.info.dart';

class EventDetailWidget extends StatefulWidget {
  EventDetailWidget({required this.event, Key? key}) : super(key: key);
  EventModel? event;

  @override
  _EventDetailWidgetState createState() => _EventDetailWidgetState();
}

class _EventDetailWidgetState extends State<EventDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 30.h,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(widget.event?.eventImage ?? ""),
                )),
              ),
              const Expanded(child: SizedBox())
            ],
          ),
          Column(
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: SizedBox(
                    height: 25.h,
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: SvgPicture.asset(
                            "assets/icons/goBackEventDetail.svg")),
                  ),
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
                              widget.event?.name ?? "",
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
                          "1200 da",
                          "par place",
                          "eventTicket",
                        ),
                        SizedBox(
                          height: 0.5.h,
                        ),
                        CommentEventWidget(),
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
                        buttonEvent("Acheter ticker", 'gishet', () {}),
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
