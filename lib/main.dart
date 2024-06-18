import 'package:dokter_app/pages/MainPage/MainPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dokter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'PlusJakartaSans',
      ),
      home: const MainPage(),
    );
  }
}
