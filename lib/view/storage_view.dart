import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:open_filex/open_filex.dart';
import 'package:trainee/controllers/firebase_controller.dart';

class StorageView extends StatelessWidget {
  const StorageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Storage')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: GetBuilder<FirebaseController>(
            init: FirebaseController(),
            builder: (controller) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final result = await FilePicker.platform.pickFiles();
                    if (result == null) return;
                    final filePath = result.files.first.path;
                    await controller.uploadFile(File(filePath!), 'images');
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 30,
                    ),
                  ),
                  child: const Text(
                    'Upload Image',
                    textScaler: TextScaler.linear(1.5),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    final result = await FilePicker.platform.pickFiles();
                    if (result == null) return;
                    final filePath = result.files.first.path;
                    await controller.uploadFile(File(filePath!), 'videos');
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 30,
                    ),
                  ),
                  child: const Text(
                    'Upload Video',
                    textScaler: TextScaler.linear(1.5),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    final result = await FilePicker.platform.pickFiles();
                    if (result == null) return;
                    final filePath = result.files.first.path;
                    await controller.uploadFile(File(filePath!), 'docs');
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 30,
                    ),
                  ),
                  child: const Text(
                    'Upload Document',
                    textScaler: TextScaler.linear(1.5),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    // final filePath = await controller
                    //     .downloadFile('images/20230722_063944.jpg');
                    // await OpenFilex.open(filePath);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 30,
                    ),
                  ),
                  child: const Text(
                    'Download File',
                    textScaler: TextScaler.linear(1.5),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
