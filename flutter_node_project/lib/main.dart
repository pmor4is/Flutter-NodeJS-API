import 'package:flutter/material.dart';
import 'package:flutter_node_project/pages/home_page.dart';

Future main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterNode',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const HomeScreen()
    );
  }
}