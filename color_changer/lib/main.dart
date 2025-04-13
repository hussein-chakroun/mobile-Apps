import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: ColorChanger());
  }
}

class ColorChanger extends StatefulWidget {
  const ColorChanger({super.key});

  @override
  State<ColorChanger> createState() => _ColorChangerState();
}

class _ColorChangerState extends State<ColorChanger> {
  int red = 0;
  int blue = 0;
  int green = 0;

  int CurrentDirection = 0;
  final List<AlignmentGeometry> beginAlignments = [
    Alignment.topCenter,
    Alignment.centerLeft,
    Alignment.topLeft,
    Alignment.topRight,
  ];

  final List<AlignmentGeometry> endAlignments = [
    Alignment.bottomCenter,
    Alignment.centerRight,
    Alignment.bottomRight,
    Alignment.bottomLeft,
  ];
  void changeColor() {
    setState(() {
      red = Random().nextInt(256);
      blue = Random().nextInt(256);
      green = Random().nextInt(256);
    });
  }

  void ChangeDirection() {
    setState(() {
      CurrentDirection = (CurrentDirection + 1) % 4;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Color Changer'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: beginAlignments[CurrentDirection],
            end: endAlignments[CurrentDirection],
            colors: [Color.fromRGBO(red, green, blue, 1.0), Colors.white],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Red: $red', style: const TextStyle(fontSize: 24)),
              Text('Green: $green', style: const TextStyle(fontSize: 24)),
              Text('Blue: $blue', style: const TextStyle(fontSize: 24)),
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: changeColor,
                child: const Text('Change Color'),
              ),
              const SizedBox(height: 10),
              Text(
                'Current Direction: ${CurrentDirection == 0
                    ? "Top"
                    : CurrentDirection == 1
                    ? "Left"
                    : CurrentDirection == 2
                    ? "Right"
                    : "Bottom"}',
                style: const TextStyle(fontSize: 24),
              ),
              ElevatedButton(
                onPressed: ChangeDirection,
                child: const Text('Change Direction'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
