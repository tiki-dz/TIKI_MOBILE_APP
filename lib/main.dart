import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:tiki/views/Authentification/widget.login.dart';
import 'package:tiki/views/Authentification/widget.resetPassword.dart';
import 'package:tiki/views/Authentification/widget.signup.dart';
import 'package:tiki/views/ButtomBar/widget.bottomBar.dart';
import 'package:tiki/views/DetailEvent/widget.eventDetail.dart';
import 'package:tiki/views/Profile/EditProfiles/widget.editProfile.dart';
import 'package:tiki/views/Profile/Profile/widget.profile.dart';
import 'package:device_preview/device_preview.dart';
import 'package:tiki/views/Wrapper/widget.wrapperOnBoarding.dart';
import 'package:tiki/views/onBoarding/widget.onBoarding.dart';


import 'data/translation.data.dart';

 /*void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  runApp(
    DevicePreview(
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}*/

 void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  runApp(
    MyApp(), // Wrap your app
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
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => WrapperOnBoardingWidget()),
          GetPage(name: '/bottomBar', page: () => BottomBarWidget()),
        ],
        debugShowCheckedModeBanner: false,
        home: WrapperOnBoardingWidget(),
      );
    });
  }
}
