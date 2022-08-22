import 'package:flutter/material.dart';
import 'dart:io';

import 'package:webview_flutter/webview_flutter.dart';
import 'package:get/get.dart';

import '../../constWidgets/snackBar.dart';
import '../ButtomBar/widget.bottomBar.dart';
class PaymentWebView extends StatefulWidget {
  PaymentWebView({Key? key,required this.url}) : super(key: key);
  String? url;

  @override
  _PaymentWebViewState createState() => _PaymentWebViewState();
}

class _PaymentWebViewState extends State<PaymentWebView> {@override
void initState() {
  super.initState();
  // Enable virtual display.
  if (Platform.isAndroid) WebView.platform = AndroidWebView();
}

@override
Widget build(BuildContext context) {
  print(widget.url);
  return SafeArea(
    child: WebView(
      navigationDelegate: (NavigationRequest request) {
        //http://localhost:8090/home
        print(request.url);
        if(request.url=="http://127.0.0.1:8091/") {
          Get.offAll(() => const BottomBarWidget(),
              transition: Transition.rightToLeft);
          snackBarModel("succes".tr, "operation_done".tr, false);

          //You can do anything

          //Prevent that url works
          return null!;
        }
        //Any other url works
        return null!;
      },
      javascriptMode: JavascriptMode.unrestricted,
      initialUrl : widget.url,
    ),
  );
}
}

