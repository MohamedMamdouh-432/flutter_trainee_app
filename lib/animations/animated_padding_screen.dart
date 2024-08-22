import 'package:flutter/material.dart';

class AnimatedPaddingScreen extends StatefulWidget {
  const AnimatedPaddingScreen({super.key});
  @override
  State<AnimatedPaddingScreen> createState() => _AnimatedPaddingScreenState();
}

class _AnimatedPaddingScreenState extends State<AnimatedPaddingScreen> {
  double padding = 10;
  List<String> chars = ["cheese", "jerry", "tom", "dog"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Padding')),
      body: GridView.builder(
        itemCount: chars.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return AnimatedPadding(
            duration: const Duration(milliseconds: 500),
            padding: EdgeInsets.all(padding),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset('assets/${chars[index]}.png'),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => setState(() {
                padding = padding == 10 ? 30 : 10;
              }),
          child: const Icon(Icons.published_with_changes_outlined)),
    );
  }
}
