import 'package:flutter/material.dart';
import 'package:ui_samples/card.dart';
import 'package:ui_samples/filter.dart';
import 'package:ui_samples/plan.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Filter());
  }
}
