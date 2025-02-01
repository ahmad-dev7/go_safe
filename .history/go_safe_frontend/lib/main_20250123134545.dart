import 'package:flutter/material.dart';

void main () {
  runApp()
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Go Safe',
      routes:<String, WidgetBuilder>{
        '/': (context) => MyHomePage(),
      },
    );
  }
}