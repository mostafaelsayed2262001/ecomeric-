import 'package:ecomerec/lib/logic/controllers/auth_controller.dart';
import 'package:ecomerec/lib/utils/themes.dart';
import 'package:ecomerec/lib/view/widgets/text_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogOutWidget extends StatelessWidget {
   LogOutWidget({Key? key}) : super(key: key);
  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Get.isDarkMode?Colors.pink:Colors.green[100],
          onTap: () {
                  Get.defaultDialog(
                    title: 'Log out From App',
                    titleStyle:  TextStyle(
                      fontSize: 20,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    middleText: 'Are u sure you need to logout?',
                    middleTextStyle:  TextStyle(
                      fontSize: 20,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    radius: 10,
                    textCancel: 'No',
                    cancelTextColor: Colors.black,
                    textConfirm: 'Yes',
                    confirmTextColor: Colors.black,
                    onCancel: () {

                    },
                    onConfirm: () {
                      controller.signOut();
                    },
                  buttonColor:  Get.isDarkMode ? pinkClr : mainColor);
                  //
                },
        child: Row(children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: logOutSettings,
            ),
            child: Icon(Icons.logout),
          ),
          SizedBox(
            width: 20,
          ),
          TextUtils(
              text: 'Logout'.tr,
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Get.isDarkMode ? Colors.white : Colors.black)
        ]),
      ),
    );
  }
}
