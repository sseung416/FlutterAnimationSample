import 'package:flutter/material.dart';

class TweenAnimationBuilderDemo extends StatefulWidget {
  const TweenAnimationBuilderDemo({super.key});

  @override
  State<TweenAnimationBuilderDemo> createState() =>
      _TweenAnimationBuilderDemoState();
}

class _TweenAnimationBuilderDemoState extends State<TweenAnimationBuilderDemo> {
  double _sliderValue = 0;
  Color? _endColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: TweenAnimationBuilder(
            tween: ColorTween(begin: Colors.white, end: _endColor),
            duration: const Duration(seconds: 1),
            builder: (BuildContext context, Color? color, Widget? child) {
              return ColorFiltered(
                colorFilter: ColorFilter.mode(color!, BlendMode.modulate),
                child: Image.asset('assets/images/cat.jpg'),
              );
            },
          ),
        ),
        SizedBox(
          width: 500,
          child: Slider.adaptive(
            value: _sliderValue,
            onChanged: (double value) {
              setState(() {
                _sliderValue = value;
                _endColor = Color.lerp(Colors.white, Colors.blue, value);
              });
            },
          ),
        ),
      ],
    );
  }
}
