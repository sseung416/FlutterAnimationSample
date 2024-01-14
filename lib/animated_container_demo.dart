import 'dart:math';

import 'package:flutter/material.dart';

const _duration = Duration(milliseconds: 400);

double randomBorderRadius() {
  return Random().nextDouble() * 64;
}

double randomMargin() {
  return Random().nextDouble() * 64;
}

Color randomColor() {
  return Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));
}

class AnimatedContainerDemo extends StatefulWidget {
  const AnimatedContainerDemo({super.key});

  @override
  State<AnimatedContainerDemo> createState() => _AnimatedContainerDemoState();
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
  late Color _color;
  late double _borderRadius;
  late double _margin;

  @override
  void initState() {
    super.initState();
    _color = randomColor();
    _borderRadius = randomBorderRadius();
    _margin = randomMargin();
  }

  void changeShape() {
    setState(() {
      _color = randomColor();
      _margin = randomMargin();
      _borderRadius = randomBorderRadius();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _AnimatedShape(
              color: _color,
              borderRadius: _borderRadius,
              margin: _margin,
              title: 'Default',
            ),
            _AnimatedShape(
              color: _color,
              borderRadius: _borderRadius,
              margin: _margin,
              title: 'BouncdInOut',
              curve: Curves.bounceInOut,
            ),
            _AnimatedShape(
              color: _color,
              borderRadius: _borderRadius,
              margin: _margin,
              title: 'EaseInCirc',
              curve: Curves.easeInCirc,
            ),
            _AnimatedShape(
              color: _color,
              borderRadius: _borderRadius,
              margin: _margin,
              title: 'FastOutSlowIn',
              curve: Curves.fastOutSlowIn,
            ),
            _AnimatedShape(
              color: _color,
              borderRadius: _borderRadius,
              margin: _margin,
              title: 'SlowMiddle',
              curve: Curves.slowMiddle,
            ),
          ],
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () {
            changeShape();
          },
          child: const Text('Change'),
        ),
      ],
    );
  }
}

class _AnimatedShape extends StatelessWidget {
  final Color _color;
  final double _borderRadius;
  final double _margin;
  final String _title;
  final Curve? _cureve;

  const _AnimatedShape({
    required Color color,
    required double borderRadius,
    required double margin,
    required String title,
    Curve? curve,
  })  : _color = color,
        _borderRadius = borderRadius,
        _margin = margin,
        _cureve = curve,
        _title = title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Text(_title),
          const SizedBox(height: 8),
          SizedBox(
            width: 128,
            height: 128,
            child: AnimatedContainer(
              duration: _duration,
              decoration: BoxDecoration(
                color: _color,
                borderRadius: BorderRadius.circular(_borderRadius),
              ),
              margin: EdgeInsets.all(_margin),
              curve: _cureve ?? Curves.linear,
            ),
          ),
        ],
      ),
    );
  }
}
