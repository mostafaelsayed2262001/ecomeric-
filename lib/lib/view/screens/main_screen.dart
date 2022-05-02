import 'package:badges/badges.dart';
import 'package:ecomerec/lib/logic/controllers/cart_controller.dart';
import 'package:ecomerec/lib/logic/controllers/main_controller.dart';
import 'package:ecomerec/lib/routes/routes.dart';
import 'package:ecomerec/lib/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  final controller = Get.put(MainController());
  final cartcontroller = Get.find<CartController>();


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Obx(() {
      return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          leading: Container(),
          elevation: 0,
          title: Text(controller.title[controller.currentIndex.value]),
          centerTitle: true,
          actions: [
            Obx(() => Badge(
                  position: BadgePosition.topEnd(top: 0, end: 3),
                  animationDuration: Duration(milliseconds: 300),
                  animationType: BadgeAnimationType.slide,
                  badgeContent: Text(
                    '${cartcontroller.quantity().toString()}',
                    style: TextStyle(color: Colors.white),
                  ),
                  child: IconButton(
                      icon: Icon(Icons.shopping_cart), onPressed: () {
                      Get.toNamed(Routes.cartScreen);
                    },
                  ),
                )),
            // IconButton(
            //     onPressed:
            //     icon: Image.asset('assets/images/shop.png'))
          ],
          backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
              icon: Icon(
                Icons.home,
                color: Get.isDarkMode ? pinkClr : mainColor,
              ),
              activeIcon: Icon(
                Icons.home,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.category,
                color: Get.isDarkMode ? pinkClr : mainColor,
              ),
              label: '',
              activeIcon: Icon(
                Icons.category,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                color: Get.isDarkMode ? pinkClr : mainColor,
              ),
              label: '',
              activeIcon: Icon(
                Icons.favorite,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                color: Get.isDarkMode ? pinkClr : mainColor,
              ),
              label: '',
              activeIcon: Icon(
                Icons.settings,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
            ),
          ],
          onTap: (index) {
            controller.currentIndex.value = index;
          },
          currentIndex: controller.currentIndex.value,
        ),
        body: IndexedStack(
          index: controller.currentIndex.value,
          // ignore: invalid_use_of_protected_member
          children: controller.tabs.value,
        ),
      );
    }));
  }
}
