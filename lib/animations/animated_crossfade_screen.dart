import 'package:flutter/material.dart';

class AnimatedCrossFadeScreen extends StatefulWidget {
  const AnimatedCrossFadeScreen({super.key});
  @override
  State<AnimatedCrossFadeScreen> createState() =>
      _AnimatedCrossFadeScreenState();
}

class _AnimatedCrossFadeScreenState extends State<AnimatedCrossFadeScreen> {
  CrossFadeState fadeChild = CrossFadeState.showFirst;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Cross Fade')),
      body: Center(
        child: InkWell(
          onTap: () => setState(() {
            fadeChild = fadeChild == CrossFadeState.showFirst
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst;
          }),
          child: AnimatedCrossFade(
            firstChild: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset('assets/jerry.png'),
            ),
            secondChild: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset('assets/dog.png'),
            ),
            crossFadeState: fadeChild,
            duration: const Duration(milliseconds: 1500),
          ),
        ),
      ),
    );
  }
}
