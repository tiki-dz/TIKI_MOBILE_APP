import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

import 'package:tiki/data/font.data.dart';
import 'package:tiki/views/Profile/widget.profile.dart';
import '../../data/pallete.data.dart';
import '../Authentification/components/component.button.dart';
import '../Authentification/components/component.input.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: BackGroundColor,
      body: AnimatedSplashScreen(
      splash:
 
          Image.asset("assets/icons/tiki1.png",width: 200,height: 200 ,fit: BoxFit.fitWidth),
             
          // const Text("from TICKI",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))

      duration: 4000,
      backgroundColor: Color.fromARGB(255, 243, 243, 242),
      nextScreen: ProfileWidget(),
      splashTransition: SplashTransition.fadeTransition,
      splashIconSize: 200,
      pageTransitionType: PageTransitionType.leftToRightWithFade,
      animationDuration: Duration(seconds: 3),
    )
    );
  }
}

