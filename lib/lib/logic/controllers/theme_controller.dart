

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController {
  final GetStorage boxStorage = GetStorage();
  final key = 'isDarkModes';
  saveDataInBox(value){
    boxStorage.write(key, value);
  }
  bool getDataFromBox(){
    return boxStorage.read<bool>(key)??false;
  }
  ThemeMode get themeDataGet =>getDataFromBox()?ThemeMode.dark:ThemeMode.light;

  void changesTheme (){
    Get.changeThemeMode(getDataFromBox()?ThemeMode.light:ThemeMode.dark);
    saveDataInBox(!getDataFromBox());
  }
}