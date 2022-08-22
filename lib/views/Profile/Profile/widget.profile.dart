import 'package:flutter/material.dart';
import 'package:tiki/controllers/EditProfileController.dart';
import 'package:tiki/views/Profile/EditProfiles/widget.editProfile.dart';
import 'package:tiki/views/Profile/ResetPassword/widget.resetPassword.dart';
import 'package:tiki/views/Profile/SavedEvents/widget.savedEvent.dart';
import '../../../controllers/ProfileController.dart';
import '../../../data/pallete.data.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

import 'components/component.card.dart';
import 'components/component.ecponsionTileMore.dart';
import 'components/component.expensionTileSettings.dart';
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
                        offset: const Offset(0, 1), // changes position of shadow
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
                        child: ClipRRect(borderRadius: BorderRadius.circular(20.h),child: picWidgetModel(controller.userProfile.picture)),
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
                          Get.to(() => EditProfileWidget());
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
            }),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 1.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 3.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      myContainer(controller.userProfile.score.toString(), "score"),
                      myContainer("0", "wallet"),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Column(
                    children: [
                      /*listTileModelWidget("score".tr, "score", () {}),*/
                      listTileModelWidget("saved_event".tr, "saveEventNotSolid",
                              () {
                            Get.to(() => const SavedEventsWidget());
                          }),
                      const ExpansionTileSettings(),
                      const ExpansionTileMore(),
                      listTileModelWidget("log_out".tr, "logout", () {
                        Get.defaultDialog(
                          onCancel: (){
                            Get.back();
                            controller.logOut();
                          },
                          onConfirm: (){
                            Get.back();
                          },
                          radius: 10.sp,
                          buttonColor: KOrange,
                          cancelTextColor: KOrange,
                          confirmTextColor: Colors.white,
                          textCancel:"deconnecter" ,
                          textConfirm:"annuler" ,
                          middleText: "Pouvez vous confirmer la déconnection",
                          contentPadding: EdgeInsets.symmetric(vertical: 2.h,horizontal: 7.w),
                          title: "Deconnection",
                        );

                        //
                      })
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
