import 'package:flutter/material.dart';
import 'package:tiki/views/splash/widget.splash.dart';
import 'package:sizer/sizer.dart';


void main() async {

  runApp(
     MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
     Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        routes: {},
        theme: ThemeData(
        ),
        home: SplashScreen(),
      );
    });
}

