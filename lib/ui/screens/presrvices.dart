import 'package:flutter/material.dart';

class Servicedetail extends StatefulWidget {
  const Servicedetail({super.key});

  @override
  State<StatefulWidget> createState() {
    return Servicedetailstate();
  }
}

class Servicedetailstate extends State {
  @override
  Widget build(BuildContext context) {
//Item lists
    return Scaffold(
      appBar: AppBar(title: const Text('More')),
    );
  }
}
