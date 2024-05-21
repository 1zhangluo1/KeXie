import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kexie_app/ui/login.dart';

import '../widgets/MainStruct.dart';

class AppRoute {
  static final GlobalKey<NavigatorState> navigatorKey =
  GlobalKey<NavigatorState>();

  static const String loginPage = "/login";
  static const String homePage = "/";
  static const String sign = "/sign";
  static const String themeMode = "/theme";
  static const String signHistory = "/sign_history";
  static const String bookBorrow = "/borrow_book";
  static const String signUp = "/sign_up";
  static const String signStatus = '/sign_status';

  static List<GetPage> routes = [
    GetPage(
        name: loginPage,
        page: () => const Login(),
        transition: Transition.cupertino),
    GetPage(
        name: homePage,
        page: () => const MainStruct(),
        transition: Transition.cupertino),
    // GetPage(
    //     name: signHistory,
    //     page: () =>
    //     transition: Transition.cupertino),
    // GetPage(
    //     name: themeMode,
    //     page: () => const ThemeSelect(),
    //     transition: Transition.cupertino),
    // GetPage(
    //     name: language_select,
    //     page: () => const Language(),
    //     transition: Transition.cupertino),
    // GetPage(
    //     name: praise_author,
    //     page: () =>
    //     transition: Transition.cupertino),
    // GetPage(
    //     name: about_our_app,
    //     page: () => const Information(),
    //     transition: Transition.cupertino),
  ];
}