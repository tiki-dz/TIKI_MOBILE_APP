import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constWidgets/cashedNetwork.dart';
Widget picWidgetModel(String? pic){
  if(pic == "http://10.0.2.2:5001/ProfileImage/user-default.jpg-1648754555891.jpg"){
    return SvgPicture.asset("assets/icons/customerS.svg");
  }else{
    return cachedNetworkProfileModel(pic ??"");
  }
}