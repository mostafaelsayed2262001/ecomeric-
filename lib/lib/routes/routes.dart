

import 'package:ecomerec/lib/logic/bindings/auth_binding.dart';
import 'package:ecomerec/lib/logic/bindings/main_binding.dart';
import 'package:ecomerec/lib/logic/bindings/product_binding.dart';
import 'package:ecomerec/lib/logic/controllers/setting_controller.dart';
import 'package:ecomerec/lib/view/screens/auth/forget_password_screen.dart';
import 'package:ecomerec/lib/view/screens/auth/login_screen.dart';
import 'package:ecomerec/lib/view/screens/payment_screen.dart';
import 'package:ecomerec/lib/view/screens/auth/signup_screen.dart';
import 'package:ecomerec/lib/view/screens/cart_screen.dart';
import 'package:ecomerec/lib/view/screens/main_screen.dart';
import 'package:ecomerec/lib/view/screens/welcome_screen.dart';

import 'package:get/get.dart';

class AppRoutes {
  //intinalRoute
  static const welcome = Routes.welcomeScreen;
  static const login = Routes.loginScreen;
  static const signUpScreen = Routes.signUpScreen;
  static const forgetpassword = Routes.forgetPasswordScreen;
  static const mainScreen = Routes.mainScreen;
  static const cartScreen = Routes.cartScreen;
  static const paymentScreen = Routes.paymentScreen;

  //getPage

  static final routes = [
    GetPage(
      name: Routes.welcomeScreen,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: login,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: signUpScreen,
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: forgetpassword,
      page: () => ForgetPassword(),

    ),
    GetPage(
      name: mainScreen,
      page: () => MainScreen(),
      bindings: [ProductBinding(),MainBinding()],
    ),
    GetPage(
      name: cartScreen,
      page: () => CartScreen(),
      bindings: [AuthBinding(),ProductBinding()]

    ),
    GetPage(
      name: paymentScreen,
      page: () => PaymentScreen(),
        bindings: [AuthBinding(),ProductBinding(),MainBinding()],

    ),
  ];
}

class Routes {
  static const welcomeScreen = '/WelcomeScreen';
  static const loginScreen = '/loginScreen';
  static const signUpScreen = '/signUpScreen';
  static const forgetPasswordScreen = '/forgetPasswordScreen';
  static const mainScreen = '/mainScreen';
  static const cartScreen = '/cartScreen';
  static const paymentScreen = '/paymentScreen';
}
