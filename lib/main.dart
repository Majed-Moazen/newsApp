import 'package:flutter/material.dart';
import 'package:news_app/screens/init_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task New App',
      debugShowCheckedModeBanner:  false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
        fontFamily: 'BonaNovaSC'
      ),
      home: const InitScreen()
    );
  }
}
