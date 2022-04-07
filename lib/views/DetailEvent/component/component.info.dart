import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:tiki/data/font.data.dart';

Widget eventInfoMode(String title, String subtitle, String icon) => ListTile(
  contentPadding: EdgeInsets.zero,
  dense: true,
      leading: SvgPicture.asset("assets/icons/$icon.svg",height: 33.sp,),
      title: Text(
        title,
        style: TextStyle(fontWeight: medium),
      ),
      subtitle: Text(
        subtitle,
      ),
    );
