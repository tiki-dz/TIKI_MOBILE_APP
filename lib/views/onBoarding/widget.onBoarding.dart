
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:concentric_transition/concentric_transition.dart';
import 'package:get/get.dart';
import 'package:tiki/views/onBoarding/CardTIKI.dart';
import 'package:lottie/lottie.dart';


class OnBoardingWidget extends StatefulWidget {
   OnBoardingWidget({Key? key}) : super(key: key);

  @override
  _OnBoardingWidgetState createState() => _OnBoardingWidgetState();
}
final data = [
  CardData(
  title: "s1title".tr,
  subtitle:
  "s1stitle".tr,
  image: LottieBuilder.asset("assets/animation/52995-emergency-helpline.json"),
  backgroundColor: const Color(0xfff39947),
  titleColor: Colors.white,
  subtitleColor: Colors.white,
  skipContu: "skip".tr,
  //background: LottieBuilder.asset("assets/animation/bg-1.json"),
),
  CardData(
  title: "s2title".tr,
  subtitle: "s2stitle".tr,
  image: LottieBuilder.asset("assets/animation/63570-expenses-calculation.json"),
  backgroundColor: Colors.white,
  titleColor: Color(0xfff39947),
  subtitleColor: const Color.fromRGBO(0, 10, 56, 1),
  skipContu: "skip".tr,

),

  CardData(
    title: "s3title".tr,
    subtitle: "s3stitle".tr,
    image: LottieBuilder.asset("assets/animation/92142-mobile-banking.json"),
    backgroundColor: const Color(0xfff39947),
    titleColor: Colors.white,
    subtitleColor: Colors.white,
    skipContu:  "skip".tr,
  ),

  CardData(
    title: "s4title".tr,
    subtitle: "s4stitle".tr,
    image: LottieBuilder.asset("assets/animation/95381-qrcode.json"),
    backgroundColor: Colors.white,
    titleColor: Color(0xfff39947),
    subtitleColor: const Color.fromRGBO(0, 10, 56, 1),
    skipContu: "continue".tr,

  ),
  CardData(
    title:"s5title".tr,
    subtitle:"s5stitle".tr,
    image: LottieBuilder.asset("assets/animation/95381-qrcode.json"),
    backgroundColor: Colors.white,
    titleColor: Color(0xfff39947),
    subtitleColor: const Color.fromRGBO(0, 10, 56, 1),
    skipContu: "continue".tr,

  ),
];
class _OnBoardingWidgetState extends State<OnBoardingWidget>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConcentricPageView(
        colors: data.map((e) => e.backgroundColor).toList(),
        itemCount: 4,
        itemBuilder: (int index, double value) {
          return CardTIKI(data: data[index]);
        },
      ),
    );
  }

}

