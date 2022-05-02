import 'package:ecomerec/lib/logic/controllers/auth_controller.dart';
import 'package:ecomerec/lib/logic/controllers/theme_controller.dart';
import 'package:ecomerec/lib/utils/themes.dart';
import 'package:ecomerec/lib/view/widgets/setting/dark_mode_widget.dart';
import 'package:ecomerec/lib/view/widgets/setting/language_widget.dart';
import 'package:ecomerec/lib/view/widgets/setting/log_out_widget.dart';
import 'package:ecomerec/lib/view/widgets/setting/profile_widget.dart';
import 'package:ecomerec/lib/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({Key? key}) : super(key: key);
  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: ListView(padding: EdgeInsets.all(24), children: [
        ProfileWidget(),
        const SizedBox(
          height: 10,
        ),
        Divider(
          thickness: 2,
          color: Get.isDarkMode ? Colors.white : Colors.grey,
        ),
        const SizedBox(height: 20,),
        TextUtils(
            text: 'GENERAL'.tr,
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Get.isDarkMode ? pinkClr : mainColor),
        const SizedBox(height: 20,),
       DarkModeWidget(),
        const SizedBox(height: 20,),
        LanguageWidget(),
        const SizedBox(height: 20,),
        LogOutWidget(),

      ]),
      // body: Center(
      //   child: Column(
      //     children: [
      //       TextButton(
      //         onPressed: () {
      //           ThemeController().changesTheme();
      //         },
      //         child: Text("SettingScreen ",
      //             style: TextStyle(
      //                 color: Get.isDarkMode ? Colors.white : Colors.black)),
      //       ),
      //       GetBuilder<AuthController>(builder: (_) {
      //         return TextButton(
      //           onPressed: () {
      //             Get.defaultDialog(
      //               title: 'Log out From App',
      //               titleStyle:  TextStyle(
      //                 fontSize: 20,
      //                 color: Get.isDarkMode ? Colors.white : Colors.black,
      //                 fontWeight: FontWeight.bold,
      //               ),
      //               middleText: 'Are u sure you need to logout?',
      //               middleTextStyle:  TextStyle(
      //                 fontSize: 20,
      //                 color: Get.isDarkMode ? Colors.white : Colors.black,
      //                 fontWeight: FontWeight.bold,
      //               ),
      //               radius: 10,
      //               textCancel: 'No',
      //               cancelTextColor: Colors.black,
      //               textConfirm: 'Yes',
      //               confirmTextColor: Colors.black,
      //               onCancel: () {
      //
      //               },
      //               onConfirm: () {
      //                 controller.signOut();
      //               },
      //             buttonColor:  Get.isDarkMode ? pinkClr : mainColor);
      //             //
      //           },
      //           child: Text("log out ",
      //               style: TextStyle(
      //                   color: Get.isDarkMode ? Colors.white : Colors.black)),
      //         );
      //       }),
      //     ],
      //   ),
      // ),
    );
  }
}
