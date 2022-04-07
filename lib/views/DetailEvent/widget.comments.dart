import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:tiki/data/font.data.dart';

import 'component/component.commentEvent.dart';
class CommentEventWidget extends StatefulWidget {
  const CommentEventWidget({Key? key}) : super(key: key);

  @override
  _CommentEventWidgetState createState() => _CommentEventWidgetState();
}

class _CommentEventWidgetState extends State<CommentEventWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            commentModelEvent(),
            commentModelEvent(),
            commentModelEvent(),
            commentModelEvent(),
            SizedBox(width: 7.w,),
            Text("+200 comments", style: TextStyle(fontSize: 10.sp,fontWeight: medium),),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: SvgPicture.asset("assets/icons/comment.svg"),
        ),
      ],
    );
  }
}
