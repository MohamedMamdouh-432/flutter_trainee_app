import 'package:flutter/material.dart';

class AnimatedOpacityScreen extends StatefulWidget {
  const AnimatedOpacityScreen({super.key});
  @override
  State<AnimatedOpacityScreen> createState() => _AnimatedOpacityScreenState();
}

class _AnimatedOpacityScreenState extends State<AnimatedOpacityScreen> {
  double opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Opacity')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: opacity,
              duration: const Duration(milliseconds: 500),
              child: const Text('Animated Opacity Text'),
            ),
            AnimatedOpacity(
              opacity: opacity,
              duration: const Duration(milliseconds: 2000),
              child: Image.asset('assets/jerry.png', height: 200),
            ),
            AnimatedOpacity(
              opacity: opacity,
              duration: const Duration(milliseconds: 3500),
              child: Image.asset('assets/tom.png', height: 200),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              opacity = opacity == 1.0 ? 0.0 : 1.0;
            });
          },
          child: const Icon(Icons.remove_red_eye)),
    );
  }
}
