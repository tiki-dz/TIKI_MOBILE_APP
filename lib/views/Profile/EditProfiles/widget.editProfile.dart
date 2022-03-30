import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiki/data/font.data.dart';
import '../../../controllers/EditProfileController.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import '../../Authentification/components/component.button.dart';
import 'component/component.input.dart';
import 'component/component.inputDate.dart';

class EditProfileWidget extends StatefulWidget {
  EditProfileWidget({Key? key}) : super(key: key);

  @override
  _EditProfileWidgetState createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EditProfileController());
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
          width: 100.w,
          height: 95.h,
          child: Stack(
            children: [
              SizedBox(
                width: 100.w,
                height: 95.h,
                child: SvgPicture.asset(
                  "assets/icons/backgroundEditProfile.svg",
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 7.w),
                child: Column(
                  children: [
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "Edit Profile",
                      style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.white,
                          fontWeight: semiBold),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Center(
                      child: Container(
                        height: 90.sp,
                        width: 90.sp,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            shape: BoxShape.circle,
                            image: const DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cG9ydHJhaXQlMjBtYW58ZW58MHx8MHx8&w=1000&q=80"),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Expanded(
                        child: SingleChildScrollView(
                      child: Column(
                        children: [
                          InputComponentEditProfile(
                            leadingIcon: 'assets/icons/fi-rr-envelope.svg',
                            textEditingController: controller.emailController,
                            readOnly: true,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          InputComponentEditProfile(
                            leadingIcon: 'assets/icons/fi-rr-user.svg',
                            textEditingController: controller.nameController,
                            readOnly: false,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          InputComponentEditProfile(
                            leadingIcon: 'assets/icons/fi-rr-user.svg',
                            textEditingController:
                                controller.lastNameController,
                            readOnly: false,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Obx(
                            () => InputDateComponentEditProfile(
                              leadingIcon: 'assets/icons/fi-rr-calendar.svg',
                              hintText: controller.birthDate.value,
                              controller: controller,
                              function: controller.changeDate,
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          InputComponentEditProfile(
                            leadingIcon: 'assets/icons/fi-rr-envelope.svg',
                            textEditingController: controller.cityController,
                            readOnly: false,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          InputComponentEditProfile(
                            leadingIcon: 'assets/icons/fi-rr-envelope.svg',
                            textEditingController: controller.phoneNumberController,
                            readOnly: true,
                          ),
                        ],
                      ),
                    )),
                    button("Save", () {}),
                    SizedBox(
                      height: 3.h,
                    )
                  ],
                ),
              ),
            ],
          )),
    ));
  }
}
