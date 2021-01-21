import 'package:flutter/material.dart';
import 'package:news_app/screen/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News Now',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white, primarySwatch: Colors.green),
      home: SplashScreen(),
    );
  }
}

