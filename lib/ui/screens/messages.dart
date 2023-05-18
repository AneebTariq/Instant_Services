import 'package:flutter/material.dart';

class Messagescreen extends StatefulWidget {
  const Messagescreen({super.key});

  @override
  State<Messagescreen> createState() => _MessagescreenState();
}

class _MessagescreenState extends State<Messagescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Service Requests'),
        backgroundColor: Colors.green,
      ),
    );
  }
}
