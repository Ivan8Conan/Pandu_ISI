import 'package:flutter/material.dart';

class PPIDPage extends StatelessWidget {
  const PPIDPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PPID ISI Yogyakarta'),
        backgroundColor: const Color(0xFF0099FF),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Text(
            'Halaman PPID ISI Yogyakarta\n\nLayanan informasi publik dan dokumentasi.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Color(0xFF333333),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}