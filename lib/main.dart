import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:tiki/controllers/initialisationController.dart';
import 'package:tiki/controllers/localController.dart';
import 'package:tiki/views/Authentification/widget.login.dart';
import 'package:tiki/views/Authentification/widget.resetPasswordForget.dart';
import 'package:tiki/views/Authentification/widget.signup.dart';
import 'package:tiki/views/ButtomBar/widget.bottomBar.dart';
import 'package:tiki/views/DetailEvent/widget.eventDetail.dart';
import 'package:tiki/views/Filter/widget.filter.dart';
import 'package:tiki/views/Home/hometest.dart';
import 'package:tiki/views/Profile/EditProfiles/widget.editProfile.dart';
import 'package:tiki/views/Profile/Profile/widget.profile.dart';
import 'package:device_preview/device_preview.dart';
import 'package:tiki/views/Search/widget.search.dart';
import 'package:tiki/views/Wrapper/widget.wrapperOnBoarding.dart';
import 'package:tiki/views/onBoarding/widget.onBoarding.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';


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
  await Firebase.initializeApp();
  FirebaseMessaging.instance.getToken().then((token) => {print(token)});
  FirebaseMessaging.instance.subscribeToTopic('all');

  await GetStorage.init();
  await Firebase.initializeApp();
  runApp(
    const MyApp(), // Wrap your app
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  listeNotification() {
    AwesomeNotifications().initialize(null, // icon for your app notification
        [
          NotificationChannel(
            channelKey: 'PLASTI_NOTIFICATION',
            channelName: 'Proto Coders Point',
            channelDescription: "Notification example",
            defaultColor: Color(0XFF9050DD),
            playSound: true,
            enableLights: true,
            enableVibration: true,
          )
        ]);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;

      AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: DateTime
              .now()
              .microsecond,
          color: Colors.transparent,
          displayOnBackground: true,
          displayOnForeground: true,
          channelKey: 'PLASTI_NOTIFICATION',
          notificationLayout: NotificationLayout.Inbox,
          hideLargeIconOnExpand: true,
          title: notification!.title,
          body: notification.body,
        ),
      );
    });
  }
  @override
  void initState() {
    listeNotification();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      Get.put(InitialisationController());
      return GetMaterialApp(
        translations: LocalString(),
        locale: LocalController.getLang() == "fr" ?  Locale('fr', 'FR') : Locale('en', 'EN') ,
        theme: ThemeData(
            textTheme: GoogleFonts.poppinsTextTheme(
              Theme.of(context).textTheme,
            ),
            backgroundColor: Colors.white),
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => const WrapperOnBoardingWidget()),
          GetPage(name: '/bottomBar', page: () => const BottomBarWidget()),
          GetPage(name: '/search', page: () => const SearchWidget()),
          GetPage(name: '/filter', page: () =>  FilterWidget(search: "",)),
        ],
        debugShowCheckedModeBanner: false,
        home: WrapperOnBoardingWidget(),
      );
    });
  }
}
