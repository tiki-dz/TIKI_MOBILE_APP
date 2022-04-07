import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:tiki/data/font.data.dart';
import 'package:tiki/views/DetailEvent/widget.comments.dart';

import 'component/component.button.dart';
import 'component/component.info.dart';

class EventDetailWidget extends StatefulWidget {
  const EventDetailWidget({Key? key}) : super(key: key);

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
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      "https://www.nabeulvoyages.com//medias/g_custom_v1519627962_vltlogy23k1iid9pjffx.jpg"),
                )),
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
                      child: SvgPicture.asset(
                          "assets/icons/goBackEventDetail.svg")),
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
                              "Knives Out",
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
                          "Mar, Jan 30 ,2020",
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
                            "loLe Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l'imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n'a pas fait que survivre cinq siècles, mais s'est aussi adapté à la bureautique informatique, sans que son contenu n'en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.",
                          style: TextStyle(fontSize: 10.sp),),
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
