import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trainee/utils/theme/theme_controller.dart';

import '../widgets/widgets.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final controller = Get.find<AppThemeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          GetBuilder<AppThemeController>(
            builder: (_) => AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: Switch(
                value: controller.isDark,
                onChanged: (value) => controller.changeTheme(),
              ),
            ),
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ViewButton(route: '/auth', text: 'Authentication'),
              SizedBox(height: 10),
              ViewButton(route: '/localization', text: 'Localization'),
              SizedBox(height: 10),
              ViewButton(route: '/storage', text: 'Storage'),
              SizedBox(height: 10),
              ViewButton(route: '/map', text: 'Google Map'),
              SizedBox(height: 10),
              ViewButton(route: '/animation', text: 'Animation'),
            ],
          ),
        ),
      ),
    );
  }
}
