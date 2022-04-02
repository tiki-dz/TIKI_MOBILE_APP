import 'package:flutter/material.dart';
import 'package:tiki/controllers/EditProfileController.dart';
import 'package:tiki/views/Profile/EditProfiles/widget.editProfile.dart';
import '../../../controllers/ProfileController.dart';
import '../../../data/pallete.data.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

import 'components/component.card.dart';
import 'components/component.item.dart';


class ProfileWidget extends StatefulWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
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
"https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cG9ydHJhaXQlMjBtYW58ZW58MHx8MHx8&w=1000&q=80"                            ),
                            fit: BoxFit.fill),
                        shape: BoxShape.circle),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.userProfile.firstName + " " + controller.userProfile.lastName,
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(controller.userProfile.email,
                          style: GoogleFonts.poppins(
                              fontSize: 10.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w500))
                    ],
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  InkWell(
                    onTap: (){
                     Get.to(EditProfileWidget());
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      child: SvgPicture.asset(
                        "assets/icons/edit.svg",
                        height: 15.sp,
                        width: 15.sp,
                      ),
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




