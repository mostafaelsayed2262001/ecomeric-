import 'package:ecomerec/lib/view/screens/category_screen.dart';
import 'package:ecomerec/lib/view/screens/favorites_screen.dart';
import 'package:ecomerec/lib/view/screens/home_screen.dart';
import 'package:ecomerec/lib/view/screens/settings_screen.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;
  final tabs = [
     HomeScreen(),
    const CategoryScreen(),
     FavoritesScreen(),
     SettingScreen(),
  ].obs;
  final title = [
    'Devil Shop',
    'Categories',
    'Favourites',
    'Settings'
  ].obs;
}
