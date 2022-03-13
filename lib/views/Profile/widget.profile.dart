import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/pallete.data.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
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
                    height: 70.0,
                    width: 70.0,
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
                            fontSize: 20.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      Text("0669301478",
                          style: GoogleFonts.poppins(
                              fontSize: 15.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w500))
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SvgPicture.asset("assets/icons/edit.svg",height: 20,width: 20,),
                ],
              )),
          SizedBox(height: 30.h),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              children: [
                myList("Score","score"),
                myList("Settings","settings"),
                myList("Share", "share"),
                myList("Rate", "rate"),
                myList("Contacter nous", "cnous"),
                myList("F&Q", "FQ")
              ],
            ),
          )
        ],
      ),
    ));
  }
}

Widget myList(String title ,String icon  ) => Padding(
  padding: EdgeInsets.symmetric(vertical: 8.5.h),
  child:   ListTile(
     leading: Container(
       width: 50.h,
       height: 50.h,
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(10.sp),
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
       padding: EdgeInsets.all(15.sp),
       child: SvgPicture.asset("assets/icons/$icon.svg",height: 20,width: 20,color: Colors.black,),
     ),
     title: Padding(
       padding: EdgeInsets.only(left: 10),
       child: Text(
         title,
         style: GoogleFonts.poppins(
             fontSize: 16.sp,
             color: Colors.black,
             fontWeight: FontWeight.w500),
       ),
     ),
    trailing: Icon(Icons.arrow_forward_ios_rounded,color: Colors.black,),
  ),
);

