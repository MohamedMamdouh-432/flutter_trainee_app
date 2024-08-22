import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimatedLottieScreen extends StatefulWidget {
  const AnimatedLottieScreen({super.key});
  @override
  State<AnimatedLottieScreen> createState() => _AnimatedLottieScreenState();
}

class _AnimatedLottieScreenState extends State<AnimatedLottieScreen> {
  int _curPage = 0;
  final List<String> _animationsPath = [
    'assets/lottie/bird.json',
    'assets/lottie/tigger.json',
    'assets/lottie/car.json',
  ];
  final PageController _controller = PageController();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((_) {
      if (_curPage + 1 == _animationsPath.length) {
        _controller.animateToPage(
          0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.linear,
        );
      } else {
        _controller.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.decelerate,
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Lottie')),
      body: PageView.builder(
        controller: _controller,
        itemCount: _animationsPath.length,
        onPageChanged: (value) => setState(() => _curPage = value),
        itemBuilder: (context, index) {
          return Center(
            child: Lottie.asset(
              _animationsPath[index],
              repeat: true,
              reverse: true,
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _curPage,
        onTap: (value) => _controller.animateToPage(
          value,
          duration: const Duration(milliseconds: 500),
          curve: Curves.decelerate,
        ),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.animation_outlined), label: 'Bird'),
          BottomNavigationBarItem(
            icon: Icon(Icons.animation_outlined),
            label: 'Tiger',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.animation_outlined),
            label: 'Car',
          ),
        ],
      ),
    );
  }
}
