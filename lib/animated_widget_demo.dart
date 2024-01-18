import 'dart:math' as math;

import 'package:flutter/material.dart';

class AnimatedWidgetDemo extends StatefulWidget {
  const AnimatedWidgetDemo({super.key});

  @override
  State<AnimatedWidgetDemo> createState() => _AnimatedWidgetDemoState();
}

class _AnimatedWidgetDemoState extends State<AnimatedWidgetDemo>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: SpinningAndroid(controller: _controller),
    );
  }
}

class SpinningAndroid extends AnimatedWidget {
  const SpinningAndroid({
    super.key,
    required AnimationController controller,
  }) : super(listenable: controller);

  Animation<double> get _progress => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: _progress.value * 2 * math.pi,
      child: Center(
        child: Image.asset(
          'assets/images/android.png',
          fit: BoxFit.cover,
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
