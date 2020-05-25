import 'package:flutter/material.dart';
import 'ui/screens/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Netflix UI Change',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Splash(),
    );
  }
}
