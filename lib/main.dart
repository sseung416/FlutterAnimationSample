import 'package:flutter/material.dart';
import 'package:flutter_animation_sample/fade_widget.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                FadeWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
