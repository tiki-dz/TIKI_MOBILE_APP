import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../Authentification/components/component.button.dart';
import 'package:get/get.dart';
import '../Profile/widget.profile.dart';
class CardData {
  final String title;
  final String subtitle;
  final Color backgroundColor;
  final Color titleColor;
  final Color subtitleColor;
  final String skipContu;
  final Widget? image;

  CardData({
    required this.title,
    required this.subtitle,
    required this.backgroundColor,
    required this.titleColor,
    required this.subtitleColor,
    required this.skipContu,
    this.image
  });
}

class CardTIKI extends StatelessWidget {
  const CardTIKI({required this.data, Key? key,}) : super(key: key);

  final CardData data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child:Column(
        children: [
          Spacer(),
          Align(
            alignment: Alignment.topRight,
            child: RichText(
              text: TextSpan(
                  text: data.skipContu,
                  style:  TextStyle(
                    color: data.titleColor,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Get.to(ProfileWidget());
                    }),
            ),
          ),

          Spacer(),
          if(data.image != null ) data.image!,
          Spacer(),

          Text(data.title.toUpperCase(),
            style : TextStyle(
              color: data.titleColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,

            ),
            maxLines: 1,
          )
          ,
          Text(data.subtitle,
            style: TextStyle(
              color: data.subtitleColor,
              fontSize: 15,
              letterSpacing: 1,
            ),
            textAlign: TextAlign.center,
            maxLines: 3,),
          Spacer(),
          Spacer(),
          Spacer(),
          Spacer(),
          Spacer(),
          //button("skip".tr, () {
          //  Get.to(ProfileWidget());
          //}),

          Spacer(),


        ],
      ) ,);
  }
}