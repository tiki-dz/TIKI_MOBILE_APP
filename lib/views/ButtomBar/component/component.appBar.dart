import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tiki/data/font.data.dart';

AppBar appBarModel(String title, String icon1, String icon2) => AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(fontWeight: semiBold),
      ),
      leading: SvgPicture.asset("icons/assets/$icon2.svg"),
      actions: [
        SvgPicture.asset("icons/assets/$icon2.svg"),
      ],
    );
