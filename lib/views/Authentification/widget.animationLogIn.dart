import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:tiki/data/font.data.dart';
import 'package:get/get.dart';
import 'package:tiki/views/Authentification/widget.login.dart';
import 'components/component.button.dart';

class AnimationLogInWidget extends StatefulWidget {
  const AnimationLogInWidget({Key? key}) : super(key: key);

  @override
  _AnimationLogInWidgetState createState() => _AnimationLogInWidgetState();
}

class _AnimationLogInWidgetState extends State<AnimationLogInWidget> {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        LottieBuilder.asset(
            "assets/animation/11067-registration-animation.json"),
        SizedBox(height: 5.h,),
        Text(
          "animation_login".tr,
          style: TextStyle(color: Colors.black, fontSize: 12.sp,fontWeight: medium),
        ),
        SizedBox(height: 5.h,),
        Padding(
          padding:EdgeInsets.symmetric(horizontal: 7.w),
          child: button("login".tr,(){
            Get.to(()=>LogInWidget());
          }),
        )
      ],
    );
  }
}
