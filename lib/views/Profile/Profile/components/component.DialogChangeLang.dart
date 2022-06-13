import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

showMyDialogLen(BuildContext context) {
  showDialog(
      context: context,
      builder: (_) => AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  onTap: () async {
                    var locale = const Locale('en', 'US');
                    Get.updateLocale(locale);
                    Navigator.pop(context);
                  },
                  title: Text('English'),
                  trailing: Get.locale == Locale('en', 'US')
                      ? Icon(Icons.check)
                      : SizedBox(),
                ),
                Divider(),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  onTap: () async {
                    var locale = const Locale('fr', 'FR');
                    Get.updateLocale(locale);
                    Navigator.pop(context);
                  },
                  title: const Text('Fresh'),
                  trailing: Get.locale == Locale('fr', 'FR')
                      ? Icon(Icons.check)
                      : SizedBox(),
                )
              ],
            ),
          ));
}
