import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiki/views/Authentification/widget.signup.dart';
import 'package:tiki/views/Profile/widget.profile.dart';
import 'package:tiki/views/onBoarding/widget.onBoarding.dart';

import 'package:device_preview/device_preview.dart';
import 'package:sizer/sizer.dart';
import 'data/translation.data.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  runApp(
    DevicePreview(
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        translations: LocalString(),
        locale: Locale('en', 'EN'),
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: SignUpWidget(),
      );
    });
  }
}
