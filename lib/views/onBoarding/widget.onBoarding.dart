<<<<<<< Updated upstream
=======
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:concentric_transition/concentric_transition.dart';
import 'package:tiki/views/onBoarding/CardTIKI.dart';
import 'package:lottie/lottie.dart';


class OnBoardingWidget extends StatefulWidget {
   OnBoardingWidget({Key? key}) : super(key: key);

  @override
  _OnBoardingWidgetState createState() => _OnBoardingWidgetState();
}
final data = [
  CardData(
  title: "Online Store",
  subtitle:
  "Service Available 24 Hours a Day,\n 7 Days a Week",
  image: LottieBuilder.asset("assets/animation/52995-emergency-helpline.json"),
  backgroundColor: const Color(0xfff39947),
  titleColor: Colors.white,
  subtitleColor: Colors.white,
  skipContu: "Skip",
  //background: LottieBuilder.asset("assets/animation/bg-1.json"),
),
  CardData(
  title: "Find Your Favourite Event",
  subtitle: "A Long List of Events That \n You Can Choose From",
  image: LottieBuilder.asset("assets/animation/63570-expenses-calculation.json"),
  backgroundColor: Colors.white,
  titleColor: Color(0xfff39947),
  subtitleColor: const Color.fromRGBO(0, 10, 56, 1),
  skipContu: "Skip",

),

  CardData(
    title: "Easy & Safe Payment",
    subtitle: "Easy and Secure Online Payment Method",
    image: LottieBuilder.asset("assets/animation/92142-mobile-banking.json"),
    backgroundColor: const Color(0xfff39947),
    titleColor: Colors.white,
    subtitleColor: Colors.white,
    skipContu: "Skip",
  ),

  CardData(
    title: "Easy Qr Code Verification",
    subtitle: "An Easy And Secure Verification \n Methode To Avoid Counterfeiting",
    image: LottieBuilder.asset("assets/animation/95381-qrcode.json"),
    backgroundColor: Colors.white,
    titleColor: Color(0xfff39947),
    subtitleColor: const Color.fromRGBO(0, 10, 56, 1),
    skipContu: "Continue",

  ),
  CardData(
    title: "Easy Qr Code Verification",
    subtitle: "an easy and Secure Verification methode to avoid counterfeiting",
    image: LottieBuilder.asset("assets/animation/95381-qrcode.json"),
    backgroundColor: Colors.white,
    titleColor: Color(0xfff39947),
    subtitleColor: const Color.fromRGBO(0, 10, 56, 1),
    skipContu: "Continue",

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
>>>>>>> Stashed changes
