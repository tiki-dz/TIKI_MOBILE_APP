import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tiki/controllers/purchaseController.dart';
import 'package:tiki/data/font.data.dart';
import 'package:tiki/data/pallete.data.dart';
import 'package:tiki/views/payment/component/component.buttonDelete.dart';
import '../../../Models/model.person.dart';
import 'package:get/get.dart';

import '../../Authentification/components/component.button.dart';
import 'component.inputPerson.dart';

Widget addPerson(PersonModel? person, int index) {
  final controller = Get.find<PurchaseController>();
  bool add = (person == null);
  return Padding(
    padding: EdgeInsets.only(right: 2.w),
    child: InkWell(
      onTap: () {
        controller.clearControllers();
        if (!add) {
          controller.initControllers(index);
        }
        Get.bottomSheet(
          Form(
            key: controller.formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 3.h,
                      ),
                      Text(
                        "Add a person",
                        style: TextStyle(fontSize: 12.sp, fontWeight: semiBold),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      InputComponentPerson(
                        hintText: 'firstName',
                        textEditingController: controller.firstNameController,
                        leadingIcon: 'assets/icons/fi-rr-user.svg',
                        validate: controller.validateName,
                        number: false,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      InputComponentPerson(
                        hintText: 'lastName',
                        textEditingController: controller.lastNameController,
                        leadingIcon: 'assets/icons/fi-rr-user.svg',
                        validate: controller.validateLastName,
                        number:  false,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      InputComponentPerson(
                        hintText: 'phone number',
                        textEditingController: controller.phoneController,
                        leadingIcon: 'assets/icons/fi-rr-user.svg',
                        validate: controller.validatePhone,
                        number: true,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  button(add ? "Add" : "Edit", () {
                    controller.addPersonOrEdit(index);
                  }),
                  SizedBox(height: 2.h,),
                  Visibility(
                    visible: !add,
                    child: buttonDelete("Delete", (){
                      controller.deletePerson(index);
                    })
                  ),
                  SizedBox(
                    height: 2.h,
                  )
                ],
              ),
            ),
          ),
          isScrollControlled: true,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.sp),
                topRight: Radius.circular(10.sp)),
          ),
        );
      },
      child: Column(
        children: [
          SizedBox(
              height: 60.sp,
              width: 60.sp,
              child: add ? SvgPicture.asset(
                "assets/icons/addperson.svg" ,
              ):Container(
                margin: EdgeInsets.only(right: 2.w),
                padding: EdgeInsets.all(10.sp),
                height: 60.sp,
                width: 60.sp,
                decoration: BoxDecoration(
                    color: const Color(0xffF5F5F5),
                    borderRadius: BorderRadius.circular(8.sp)),
                child: SvgPicture.asset(
                  "assets/icons/customerS.svg" ,
                  color: KOrange,
                ),
              ),),
          Text(
            person?.abr() ?? "",
            style: TextStyle(fontSize: 8.sp),
          ),
        ],
      ),
    ),
  );
}
