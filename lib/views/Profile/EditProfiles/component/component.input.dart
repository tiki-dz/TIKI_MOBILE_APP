import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tiki/controllers/EditProfileController.dart';
import 'package:tiki/data/pallete.data.dart';

import '../../../../data/font.data.dart';
import '../popUpCitis/popUpMenu.dart';

class InputComponentEditProfile  extends StatelessWidget {
  String leadingIcon;
  TextEditingController textEditingController;
  bool readOnly ;
  String hint ;
  String? Function(String?) validate;

  InputComponentEditProfile(
      {required this.leadingIcon,
        required this.textEditingController,
        required this.readOnly,required this.hint,required this.validate});


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: leadingIcon == 'assets/icons/phone.svg'?  TextInputType.number:TextInputType.text ,
      onTap: (){
        if(leadingIcon =='assets/icons/city.svg' ){
          final controller = Get.find<EditProfileController>();
          showCities(context,controller.cities);
        }
      },
      validator: validate,
      readOnly: readOnly,
      cursorColor: KOrange,
      controller: textEditingController,
      style: TextStyle(fontSize: 10.sp, fontWeight: regular),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 0.05.h, horizontal: 0.0),
        prefixIcon: Row(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(
            width: 5.w,
          ),
          SvgPicture.asset(leadingIcon),
          SizedBox(
            width: 5.w,
          ),
          Container(
            height: 3.h,
            width: 0.2.w,
            color: Color.fromRGBO(112, 112, 112, 1).withOpacity(0.3),
          ),
          SizedBox(
            width: 3.w,
          ),
        ]),
        prefixIconConstraints: BoxConstraints(maxHeight: 24.h, maxWidth: 70.w),
        suffixIconConstraints: BoxConstraints(
          maxHeight: 12.sp,
          maxWidth: 50.w,
        ),
        filled: true,
        fillColor: GreyColor,
        hintText: hint,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: GreyColor),
          borderRadius: BorderRadius.circular(8.sp),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(8.sp),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(8.sp),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: GreyColor),
          borderRadius: BorderRadius.circular(8.sp),
        ),
      ),
    );
  }
}

