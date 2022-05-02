import 'package:ecomerec/lib/logic/controllers/setting_controller.dart';
import 'package:ecomerec/lib/logic/controllers/theme_controller.dart';
import 'package:ecomerec/lib/utils/themes.dart';
import 'package:ecomerec/lib/view/widgets/text_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DarkModeWidget extends StatelessWidget {
  DarkModeWidget({Key? key}) : super(key: key);
  final controller = Get.find<SettingController>();


  @override
  Widget build(BuildContext context) {
    return Obx((){return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        buildIconWidget(),
      Switch(
        activeTrackColor: Get.isDarkMode?pinkClr:mainColor,
      activeColor: Get.isDarkMode?pinkClr:mainColor,
      value: controller.switchValue.value,
      onChanged: (value) {
      ThemeController().changesTheme();
      controller.switchValue.value=value;
      })
      ]);}
    );
  }

  Widget buildIconWidget() {
    return Material(
      color: Colors.transparent,
      child: Row(children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: darkSettings,
          ),
          child: Icon(Icons.dark_mode),
        ),
        SizedBox(
          width: 20,
        ),
        TextUtils(
            text: 'Dark Mode'.tr,
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Get.isDarkMode ? Colors.white : Colors.black)
      ]),
    );
  }
}
