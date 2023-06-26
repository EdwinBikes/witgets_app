import 'dart:math' show Random;

import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  static const name = 'animated_screen';

  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 320;
  double height = 330;
  Color color = Colors.teal;
  double borderRadius = 80.0;

  void changeShape() {
    final random = Random();
    width = random.nextInt(300) + 40;
    height = random.nextInt(300) + 40;
    borderRadius = random.nextInt(100) + 20;
    color = Color.fromRGBO(
        random.nextInt(255), random.nextInt(255), random.nextInt(255), 9);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Animado'),
      ),
      body: Center(
          child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.elasticInOut,
        width: width <= 0
            ? 0
            : width, // funcion de que si el width es menor o igual a 0 entonces de 0 y si no entonces que continue el mismo widht
        height: height <= 0 ? 0 : height,
        decoration: BoxDecoration(
            color: color,
            borderRadius:
                BorderRadius.circular(borderRadius < 0 ? 0 : borderRadius)),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          changeShape();
        },
        child: const Icon(Icons.play_circle_filled_rounded),
      ),
    );
  }
}
