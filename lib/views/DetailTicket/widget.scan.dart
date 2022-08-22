import 'package:flutter/material.dart';
import 'package:tiki/data/pallete.data.dart';
import 'package:sizer/sizer.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ScanWidget extends StatefulWidget {
  ScanWidget({required this.QRCode, Key? key}) : super(key: key);
  String QRCode;

  @override
  _ScanWidgetState createState() => _ScanWidgetState();
}

class _ScanWidgetState extends State<ScanWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: KOrange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /*Text(
              "Scan me",
              style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 7.h,
            ),*/
            Container(
              padding: EdgeInsets.all(20.sp),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.sp)),
              child: QrImage(
                data: widget.QRCode,
                version: QrVersions.auto,
                size: 150.sp,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
