import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewButton extends StatelessWidget {
  final String route, text;

  const ViewButton({
    super.key,
    required this.route,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Get.toNamed(route),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 30,
        ),
      ),
      child: Text(
        text,
        textScaler: const TextScaler.linear(1.5),
      ),
    );
  }
}
