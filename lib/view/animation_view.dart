import 'package:flutter/material.dart';
import 'package:trainee/widgets/view_button.dart';

class AnimationView extends StatelessWidget {
  const AnimationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ViewButton(route: '/align', text: 'Animated Align'),
            ViewButton(route: '/container', text: 'Animated Container'),
            ViewButton(route: '/text', text: 'Animated Text Style'),
            ViewButton(route: '/opacity', text: 'Animated Opacity'),
            ViewButton(route: '/padding', text: 'Animated Padding'),
            ViewButton(route: '/physical', text: 'Animated Physical Model'),
            ViewButton(route: '/crossfade', text: 'Animated Cross Fade'),
            ViewButton(route: '/lottie', text: 'Animated Lottie'),
            ViewButton(route: '/flare', text: 'Animated Flare'),
          ],
        ),
      ),
    );
  }
}
