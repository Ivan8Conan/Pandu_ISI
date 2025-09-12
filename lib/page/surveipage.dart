import 'package:flutter/material.dart';

class SurveiPage extends StatefulWidget {
  const SurveiPage({Key? key}) : super(key: key);

  @override
  State<SurveiPage> createState() => _SurveiPageState();
}

class _SurveiPageState extends State<SurveiPage> {
  Future<void> _refresh() async {
    await Future.delayed(const Duration(milliseconds: 900));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Survei Page'),
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: const [
            SizedBox(height: 80),
            Center(
              child: Text('This is the Survei Page'),
            ),
          ],
        ),
      ),
    );
  }
}