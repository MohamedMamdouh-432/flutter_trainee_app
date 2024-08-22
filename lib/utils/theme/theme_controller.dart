import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppThemeController extends GetxController {
  bool isDark = Get.isDarkMode;
  
  @override
  onInit() {
    super.onInit();
    Get.changeTheme(ThemeData.light());
    Get.changeThemeMode(ThemeMode.light);
  }

  void changeTheme() {
    Get.changeThemeMode(!isDark ? ThemeMode.dark : ThemeMode.light);
    Get.changeTheme(!isDark ? ThemeData.dark() : ThemeData.light());
    isDark = !isDark;
    update();
  }
}
