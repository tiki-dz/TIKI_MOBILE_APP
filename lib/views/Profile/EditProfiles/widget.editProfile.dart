import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiki/Models/model.user.dart';
import 'package:tiki/data/font.data.dart';
import 'package:tiki/data/pallete.data.dart';
import '../../../constWidgets/progressIndicator.dart';
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
                      "edit_Profile".tr,
                      style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.white,
                          fontWeight: semiBold),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Center(
                      child: GetBuilder<EditProfileController>(
                          init: controller,
                          // no need to initialize Controller ever again, just mention the type
                          builder: (value) => InkWell(
                                onTap: () {
                                  controller.takePick();
                                },
                                child: Container(
                                  height: 90.sp,
                                  width: 90.sp,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          spreadRadius: 2,
                                          blurRadius: 7,
                                          offset: const Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                      shape: BoxShape.circle,
                                      image: controller.imageFromNetwork
                                          ? DecorationImage(
                                              fit: BoxFit.fill,
                                              image: NetworkImage(controller
                                                      .user.picture ??
                                                  "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cG9ydHJhaXQlMjBtYW58ZW58MHx8MHx8&w=1000&q=80"),
                                            )
                                          : DecorationImage(
                                              fit: BoxFit.fill,
                                              image: FileImage(
                                                  controller.imageFile),
                                            )),
                                ),
                              )),
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Expanded(
                        child: SingleChildScrollView(
                      child: Form(
                        key: controller.formKey,
                        child: Column(
                          children: [
                            InputComponentEditProfile(
                              leadingIcon: 'assets/icons/fi-rr-envelope.svg',
                              textEditingController: controller.emailController,
                              readOnly: true,
                              hint: "",
                              validate: controller.validateEmail,
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            InputComponentEditProfile(
                                leadingIcon: 'assets/icons/fi-rr-user.svg',
                                textEditingController: controller.nameController,
                                readOnly: false,
                                hint: "add_your".tr + "name".tr,validate: controller.validateName,),
                            SizedBox(
                              height: 2.h,
                            ),
                            InputComponentEditProfile(
                                leadingIcon: 'assets/icons/fi-rr-user.svg',
                                textEditingController:
                                    controller.lastNameController,
                                readOnly: false,
                                hint: "add_your".tr + "last_name".tr,validate: controller.validateLastName,),
                            SizedBox(
                              height: 2.h,
                            ),
                            Obx(
                              () {
                              return InputDateComponentEditProfile(
                                  leadingIcon: 'assets/icons/fi-rr-calendar.svg',
                                  hintText: controller.birthDate.value,
                                  controller: controller,
                                  function: controller.changeDate,
                                validate: controller.validateDate,
                                );
                              }
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            InputComponentEditProfile(
                              leadingIcon: 'assets/icons/city.svg',
                              textEditingController: controller.cityController,
                              readOnly: false,
                              hint: "add_your".tr + "city".tr,
                              validate: controller.validateCity,
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                           /* InputComponentEditProfile(
                              leadingIcon: 'assets/icons/phone.svg',
                              textEditingController:
                                  controller.phoneNumberController,
                              readOnly: true,
                              hint: "add your phone number",
                            ), */
                            SizedBox(
                              height: 2.h,
                            ),
                            GetBuilder<EditProfileController>(
                                init: controller,
                                // no need to initialize Controller ever again, just mention the type
                                builder: (value) => Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Row(
                                          children: [
                                            Radio(
                                              activeColor: KOrange,
                                              value: 0,
                                              groupValue: controller.radioSexe,
                                              onChanged: controller.changeRadio,
                                            ),
                                            Text(
                                              "homme".tr,
                                              style: TextStyle(fontSize: 11.sp),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Radio(
                                              activeColor: KOrange,
                                              value: 1,
                                              groupValue: controller.radioSexe,
                                              onChanged: controller.changeRadio,
                                            ),
                                            Text('femme'.tr,
                                                style:
                                                    TextStyle(fontSize: 11.sp)),
                                          ],
                                        ),
                                      ],
                                    )),
                          ],
                        ),
                      ),
                    )),
                    Obx(() => controller.isUpdating.value == false
                        ? button("save".tr, () async {
                            await controller.updateProfile();
                          })
                        : circularProgressModel()),
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
