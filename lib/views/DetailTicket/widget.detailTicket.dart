import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../data/pallete.data.dart';
import 'component/component.carouselDetailTicket.dart';

class DetailTicketWidget extends StatefulWidget {
  const DetailTicketWidget({Key? key}) : super(key: key);

  @override
  _DetailTicketWidgetState createState() => _DetailTicketWidgetState();
}

class _DetailTicketWidgetState extends State<DetailTicketWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              leading: Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.black,
                size: 14.sp,
              ),
              backgroundColor: Colors.white,
              title: const Text(
                "Détail ticket",
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true,
            ),
            body: Container(
              height: 100.h,
              width: 100.w,
              decoration: BoxDecoration(gradient: verticalLinear),
              child: CarouselDetailsTickets(),
            )));
  }
}
