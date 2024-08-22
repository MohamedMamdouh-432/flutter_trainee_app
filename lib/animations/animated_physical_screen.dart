import 'package:flutter/material.dart';

class AnimatedPhysicalModelScreen extends StatefulWidget {
  const AnimatedPhysicalModelScreen({super.key});
  @override
  State<AnimatedPhysicalModelScreen> createState() =>
      _AnimatedPhysicalModelScreenState();
}

class _AnimatedPhysicalModelScreenState
    extends State<AnimatedPhysicalModelScreen> {
  double elevation = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Physical Model')),
      body: Center(
        child: InkWell(
          onTap: () {
            setState(() {
              elevation = elevation == 0 ? 90 : 0;
            });
          },
          child: AnimatedPhysicalModel(
            shape: BoxShape.rectangle,
            elevation: elevation,
            color: Colors.grey,
            shadowColor: Colors.blueGrey,
            borderRadius: BorderRadius.circular(20),
            duration: const Duration(milliseconds: 500),
            child: SizedBox(
              height: 300,
              width: 300,
              child: Image.asset('assets/tom.png'),
            ),
          ),
        ),
      ),
    );
  }
}
