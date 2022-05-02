import 'package:ecomerec/lib/utils/my_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingController extends GetxController {
  var switchValue = false.obs;
  var storage = GetStorage();
  var langocal = ene;

  @override
  void onInit() async {
    super.onInit();
    langocal = await getLanguage;
  }

  //language
  void saveLanguage(String lang) async {
    await storage.write('lang', lang);
  }

  Future<String> get getLanguage async {
    return await storage.read('lang');
  }

  changeLanguage(String typeLang) {
    saveLanguage(typeLang);
    if (langocal == typeLang) {
      return;
    }
    if (typeLang == frn) {
      langocal = frn;
      saveLanguage(frn);
    }
    else if (typeLang == arr) {
      langocal = arr;
      saveLanguage(arr);
    }
    else {
      langocal = ene;
      saveLanguage(ene);
    }
    update();
  }
}