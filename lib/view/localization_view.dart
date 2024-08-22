import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trainee/utils/localization/locale_controller.dart';

class LocalizationView extends StatelessWidget {
  const LocalizationView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AppLocaleController>();
    return Scaffold(
      appBar: AppBar(title: Text('Home'.tr)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hardest Choices Require Strongest Wills'.tr,
              textAlign: TextAlign.center,
              textScaler: const TextScaler.linear(2),
            ),
            const SizedBox(height: 100),
            ElevatedButton(
              onPressed: () => controller.changeLang('ar'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 100,
                  vertical: 15,
                ),
              ),
              child: Text('Arabic'.tr),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => controller.changeLang('en'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 100,
                  vertical: 15,
                ),
              ),
              child: Text('English'.tr),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => controller.changeLang('de'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 100,
                  vertical: 15,
                ),
              ),
              child: Text('German'.tr),
            ),
          ],
        )),
      ),
    );
  }
}
