import 'package:flutter/material.dart';
import 'page/homepage.dart';

void main() {
  runApp(const PanduISIApp());
}

class PanduISIApp extends StatelessWidget {
  const PanduISIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pandu ISI Yogyakarta',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF5F7FA),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF42A5F5),
          foregroundColor: Colors.white,
        ),
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}