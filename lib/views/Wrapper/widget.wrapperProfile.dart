import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tiki/views/Authentification/widget.animationLogIn.dart';
import 'package:tiki/views/Profile/Profile/widget.profile.dart';

import '../../controllers/wrapperProfileController.dart';

class WrapperProfile extends StatelessWidget {
  const WrapperProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WrapperProfileController());
    return GetBuilder<WrapperProfileController>(
        init: controller,
        builder: (_) =>
            controller.sign ? const ProfileWidget() : AnimationLogInWidget());
  }
}
