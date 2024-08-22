import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trainee/utils/constants.dart';
import 'package:trainee/controllers/firebase_controller.dart';

class AuthenticationView extends StatelessWidget {
  const AuthenticationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Authentication')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: GetBuilder<FirebaseController>(
            init: FirebaseController(),
            builder: (controller) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  onChanged: (value) => phone = value,
                  decoration: const InputDecoration(hintText: 'Phone Number'),
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  onChanged: (value) => otp = value,
                  decoration: const InputDecoration(hintText: 'OTP'),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () async => await controller.signInUser(),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 30,
                    ),
                  ),
                  child: const Text(
                    'Sign In',
                    textScaler: TextScaler.linear(1.5),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async => await controller.verifyPhone(),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 30,
                    ),
                  ),
                  child: const Text(
                    'Verify OTP',
                    textScaler: TextScaler.linear(1.5),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async => await controller.loginWithGoogle(),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 30,
                    ),
                  ),
                  child: const Text(
                    'Login With Google',
                    textScaler: TextScaler.linear(1.5),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async => await controller.loginWithFacebook(),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 30,
                    ),
                  ),
                  child: const Text(
                    'Login With Facebook',
                    textScaler: TextScaler.linear(1.5),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
