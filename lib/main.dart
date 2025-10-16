import 'package:flutter/material.dart';

void main() => runApp(const MathGamesApp());

class MathGamesApp extends StatelessWidget {
  const MathGamesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Math Games (Android)',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Math Games - Android')),
      body: const Center(child: Text('Hello — Android-only prototype')),
    );
  }
}
