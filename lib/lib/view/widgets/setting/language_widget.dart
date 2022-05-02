import 'package:ecomerec/lib/logic/controllers/setting_controller.dart';
import 'package:ecomerec/lib/utils/my_string.dart';
import 'package:ecomerec/lib/utils/themes.dart';
import 'package:ecomerec/lib/view/widgets/text_utils.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageWidget extends StatelessWidget {
  LanguageWidget({Key? key}) : super(key: key);
  final controller = Get.find<SettingController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(builder: (_){return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Material(
          color: Colors.transparent,
          child: Row(children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: languageSettings,
              ),
              child: Icon(
                Icons.language_outlined,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            TextUtils(
                text: 'Language'.tr,
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Get.isDarkMode ? Colors.white : Colors.black)
          ]),
        ),
        Container(
          width: 120,
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              border: Border.all(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  width: 2)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              items: [
                DropdownMenuItem(
                  child: Text(
                    english,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  value: ene,
                ),
                DropdownMenuItem(
                  child: Text(
                    arabic,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  value: arr,
                ),
                DropdownMenuItem(
                  child: Text(
                    france,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  value: frn,
                ),
              ],
              onChanged: (value) {
                controller.changeLanguage(value!);
                Get.updateLocale(Locale(value));
              },
              iconSize: 25,
              value: controller.langocal,
              icon: Icon(
                Icons.arrow_drop_down,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
            ),
          ),
        )
      ],
    );});
  }
}
