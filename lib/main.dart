import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instant_services/ui/screens/home.dart';

void main() {
  runApp(const InstantServices());
}

class InstantServices extends StatelessWidget {
  const InstantServices({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Instant Services',
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Myhome(),
      ),
    );
  }
}
