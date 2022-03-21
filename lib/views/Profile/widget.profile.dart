import 'package:flutter/material.dart';
import '../../data/pallete.data.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Container(
              padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 5.w),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
                gradient: linear,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 45.sp,
                    width: 45.sp,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://cdn.futura-sciences.com/buildsv6/images/mediumoriginal/6/5/2/652a7adb1b_98148_01-intro-773.jpg"),
                            fit: BoxFit.cover),
                        shape: BoxShape.circle),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "djellali fouad",
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      Text("0669301478",
                          style: GoogleFonts.poppins(
                              fontSize: 10.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w500))
                    ],
                  ),
                  SizedBox(
                    width: 25.w,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                    child: SvgPicture.asset(
                      "assets/icons/edit.svg",
                      height: 15.sp,
                      width: 15.sp,
                    ),
                  ),
                ],
              )),
          SizedBox(
            height: 1.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 3.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                myContainer("2600", "score"),
                myContainer("2600", "wallet"),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: Column(
              children: [
                myListTile("Score", "score"),
                myListTile("Settings", "settings"),
                myListTile("Share", "share"),
                myListTile("Rate", "rate"),
                myListTile("Contacter nous", "cnous"),
                myListTile("F&Q", "FQ")
              ],
            ),
          )
        ],
      ),
    ));
  }
}

Widget myListTile(String title, String icon) => Padding(
      padding: EdgeInsets.symmetric(vertical: 0.5.h),
      child: ListTile(
        leading: Container(
          width: 35.sp,
          height: 35.sp,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.sp),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          padding: EdgeInsets.all(11.sp),
          child: SvgPicture.asset(
            "assets/icons/$icon.svg",
            height: 20,
            width: 20,
            color: Colors.black,
          ),
        ),
        title: Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            title,
            style: GoogleFonts.poppins(
                fontSize: 11.sp,
                color: Colors.black,
                fontWeight: FontWeight.w500),
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          color: Colors.black,
          size: 12.sp,
        ),
      ),
    );

Widget myContainer(String title, String icon) => Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.sp),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.5.h),
      child: Row(
        children: [
          SvgPicture.asset(
            "assets/icons/$icon.svg",
            height: 20,
            width: 20,
            color: Orange,
          ),
          SizedBox(
            width: 4.w,
          ),
          Text(
            title,
            style: TextStyle(color: Orange),
          )
        ],
      ),
    );
