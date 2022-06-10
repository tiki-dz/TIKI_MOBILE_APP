import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constWidgets/cashedNetwork.dart';
picWidgetModel(String? pic){
  if(pic ==null){
    return cachedNetworkModel(pic ??"");
  }else{
    return SvgPicture.asset("assets/icons/customerS.svg");
  }
}