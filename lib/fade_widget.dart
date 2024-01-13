import 'package:flutter/material.dart';

/// AnimatedOpacity의 예제
class FadeWidget extends StatefulWidget {
  const FadeWidget({super.key});

  @override
  State<FadeWidget> createState() => _FadeWidget();
}

class _FadeWidget extends State<FadeWidget> {
  double _opactity = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedOpacity(
          opacity: _opactity,
          duration: const Duration(seconds: 2),
          child: const Column(
            children: [
              Text(
                'Hello World!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 16),
              Text('헬로우 월드'),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _opactity = 1;
                });
              },
              child: const Text('fade in'),
            ),
            const SizedBox(width: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _opactity = 0;
                });
              },
              child: const Text('fade out'),
            ),
          ],
        )
      ],
    );
  }
}
