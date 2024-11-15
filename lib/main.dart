import 'package:correspondant_application/screens/home_screen.dart';
import 'package:correspondant_application/widgets/bottombar_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BottomBar(),
    );
  }
}
