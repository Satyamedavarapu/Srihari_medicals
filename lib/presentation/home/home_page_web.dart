import 'package:flutter/material.dart';

class MyWebHomePage extends StatefulWidget {
  const MyWebHomePage({super.key});

  @override
  State<MyWebHomePage> createState() => _MyWebHomePageState();
}

class _MyWebHomePageState extends State<MyWebHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sri Hari Medicals'),
      ),
    );
  }
}
