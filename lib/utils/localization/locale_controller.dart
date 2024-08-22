import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppLocaleController extends GetxController {
  void setLang(String langCode) {
    Locale langLocale = Locale(langCode);
    Get.updateLocale(langLocale);
  }

  void changeLang(String langCode) {
    Locale langLocale = Locale(langCode);
    Get.updateLocale(langLocale);
  }
}
