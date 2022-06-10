import 'package:flutter/material.dart';
import 'package:tiki/controllers/EditProfileController.dart';
import 'package:tiki/views/Profile/EditProfiles/widget.editProfile.dart';
import 'package:tiki/views/Profile/ResetPassword/widget.resetPassword.dart';
import '../../../controllers/ProfileController.dart';
import '../../../data/pallete.data.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

import 'components/component.card.dart';
import 'components/component.item.dart';
import 'components/componentPicWidget.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return Column(
      children: [
        GetBuilder(
          init: controller,
          builder: (context) {
            return Container(
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
                         /* image: DecorationImage(
                              image:
                              picWidgetModel(controller.userProfile.picture),
                              fit: BoxFit.fill),*/
                          shape: BoxShape.circle),
                      child: picWidgetModel(controller.userProfile.picture),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.userProfile.firstName,
                          style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(controller.userProfile.email,
                            style: GoogleFonts.poppins(
                                fontSize: 9.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w500))
                      ],
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(()=>EditProfileWidget());
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
                ));
          }
        ),
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
              myListTile("score".tr, "score",(){

              }),
              myListTile("settings".tr, "settings",(){
                Get.to(()=>ResetPasswordWidget());

              }),
              myListTile("share".tr, "share",(){

              }),
              myListTile("rate".tr, "rate",(){

              }),
              myListTile("contact_us".tr, "cnous",(){

              }),
              myListTile("F&Q".tr, "FQ",(){

              }),
              myListTile("log_out".tr, "logout",(){
                controller.logOut();
              })
            ],
          ),
        )
      ],
    );
  }
}
