import 'package:flutter/material.dart';

class AnimatedAlignScreen extends StatefulWidget {
  const AnimatedAlignScreen({super.key});
  @override
  State<AnimatedAlignScreen> createState() => _AnimatedAlignScreenState();
}

class _AnimatedAlignScreenState extends State<AnimatedAlignScreen> {
  int _jerryPosition = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Align')),
      body: Stack(
        children: [
          AnimatedAlign(
            alignment: getNextAlignmentPosition(_jerryPosition),
            duration: const Duration(seconds: 1),
            child: Container(
              width: 200,
              height: 200,
              color: Colors.transparent,
              child: Image.asset('assets/jerry.png'),
            ),
          ),
          AnimatedAlign(
            alignment: getNextAlignmentPosition(_jerryPosition + 1),
            duration: const Duration(seconds: 1),
            child: Container(
              width: 200,
              height: 200,
              color: Colors.transparent,
              child: Image.asset('assets/tom.png'),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          _jerryPosition = (_jerryPosition + 1) % 9;
        }),
        child: const Icon(Icons.animation_rounded),
      ),
    );
  }

  AlignmentGeometry getNextAlignmentPosition(int position) {
    switch (position) {
      case 0:
        return Alignment.topLeft;
      case 1:
        return Alignment.centerRight;
      case 2:
        return Alignment.bottomLeft;
      case 3:
        return Alignment.topCenter;
      case 4:
        return Alignment.centerLeft;
      case 5:
        return Alignment.bottomCenter;
      case 6:
        return Alignment.center;
      case 7:
        return Alignment.topRight;
      case 8:
        return Alignment.bottomRight;
      default:
        return Alignment.bottomLeft;
    }
  }
}
