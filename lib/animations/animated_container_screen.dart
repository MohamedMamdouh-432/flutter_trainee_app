import 'package:flutter/material.dart';

class AnimatedContainerScreen extends StatefulWidget {
  const AnimatedContainerScreen({super.key});
  @override
  State<AnimatedContainerScreen> createState() =>
      _AnimatedContainerScreenState();
}

class _AnimatedContainerScreenState extends State<AnimatedContainerScreen> {
  double width = 200, height = 200;
  Color color = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Container')),
      body: Center(
        child: InkWell(
          onTap: () => setState(() {
            height = width = 300;
            color = Colors.orange;
          }),
          child: AnimatedContainer(
            height: height,
            width: width,
            duration: const Duration(milliseconds: 500),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.asset('assets/jerry.png'),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          width = height = 200;
          color = Colors.grey;
        }),
        child: const Icon(Icons.restore),
      ),
    );
  }
}
