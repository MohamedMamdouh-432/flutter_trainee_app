import 'package:flutter/material.dart';

class AnimatedTextStyleScreen extends StatefulWidget {
  const AnimatedTextStyleScreen({super.key});
  @override
  State<AnimatedTextStyleScreen> createState() =>
      _AnimatedTextStyleScreenState();
}

class _AnimatedTextStyleScreenState extends State<AnimatedTextStyleScreen> {
  double size = 22;
  Color color = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Text Style')),
      body: Center(
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 500),
          style: TextStyle(
            color: color,
            fontSize: size,
          ),
          child: const Text('Animated Text'),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
            onPressed: () => setState(() {
              size = 40;
              color = Colors.deepOrange;
            }),
            child: const Icon(Icons.add),
          ),
          ElevatedButton(
            onPressed: () => setState(() {
              size = 22;
              color = Colors.black;
            }),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
