import 'package:get/get.dart';

class HomeController extends GetxController {
  var cnt1 = 0.obs;
  var cnt2 = 0.obs;

  void increment1() {
    cnt1++;
  }

  void decrement1() {
    cnt1--;
  }
}
