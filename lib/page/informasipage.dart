import 'package:flutter/material.dart';

class InformasiPage extends StatelessWidget {
  const InformasiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informasi'),
      ),
      body: const Center(
        child: Text(
          'Ini adalah halaman Informasi.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}