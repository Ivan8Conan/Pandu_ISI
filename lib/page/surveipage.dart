import 'package:flutter/material.dart';

class SurveiPage extends StatelessWidget {
  const SurveiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Survei Page'),
      ),
      body: const Center(
        child: Text('This is the Survei Page'),
      ),
    );
  }
}