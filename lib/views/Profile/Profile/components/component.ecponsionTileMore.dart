import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:tiki/views/Profile/ResetPassword/widget.resetPassword.dart';

import 'component.DialogChangeLang.dart';
import 'component.item.dart';

class ExpansionTileMore extends StatefulWidget {
  const ExpansionTileMore({Key? key}) : super(key: key);

  @override
  _ExpansionTileMoreState createState() => _ExpansionTileMoreState();
}

class _ExpansionTileMoreState extends State<ExpansionTileMore> {
  bool _customTileExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.5.h),
      child: ExpansionTile(
        leading: Container(
          width: 35.sp,
          height: 35.sp,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.sp),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: _customTileExpanded ?0: 1,
                blurRadius:_customTileExpanded ?0: 5,
                offset: Offset(0, _customTileExpanded ?0:2), // changes position of shadow
              ),
            ],
          ),
          padding: EdgeInsets.all(11.sp),
          child: SvgPicture.asset(
            "assets/icons/more.svg",
            height: 20,
            width: 20,
            color: _customTileExpanded ? Colors.grey:Colors.black,
          ),
        ),
        title: Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            "more".tr,
            style: GoogleFonts.poppins(
                fontSize: 11.sp,
                color: _customTileExpanded ? Colors.grey:Colors.black,
                fontWeight: FontWeight.w500),
          ),
        ),
        trailing: Icon(
          _customTileExpanded ? Icons.keyboard_arrow_up_rounded:Icons.keyboard_arrow_down_rounded  ,
          color: _customTileExpanded ? Colors.grey:Colors.black,
          size: 18.sp,
        ),
        onExpansionChanged: (bool expanded) {
          setState(() => _customTileExpanded = expanded);
        },
        children: [
          listTileModelWidget("share".tr, "share",(){

          }),
          listTileModelWidget("rate".tr, "rate",(){

          }),
          listTileModelWidget("contact_us".tr, "cnous",(){

          }),
          listTileModelWidget("F&Q".tr, "FQ",(){

          }),
        ],
      ),
    );
  }
}
