import 'package:flutter/material.dart';

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
    return SafeArea(
      child: Scaffold(backgroundColor: Colors.white,body:

        Padding(
          padding:  EdgeInsets.all(10),
          child: Column(
            children: [
              button("Sign up",(){
                print('cc');
              })
            ],
          ),
        ),),
    );
  }
}

