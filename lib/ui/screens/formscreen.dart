import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'finishscreen.dart';

class Formdetail extends StatelessWidget {
  Formdetail({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//Bottom button
      bottomNavigationBar: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            border: Border.all(width: 0.2),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
          ),
          padding: const EdgeInsets.all(20.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            child: const Text(
              'Continue',
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () {
              Get.to(() => const FinishingScreen());
            },
          )),
//Appbar
      appBar: AppBar(
        title: const Text('Location'),
        backgroundColor: Colors.green,
      ),
// Screen Body
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
//Text field for city
            const SizedBox(
              height: 10,
            ),
            _textfields('City'),
// Text field for area
            const SizedBox(
              height: 10,
            ),
            _textfields('Area'),
// Text field for Street
            const SizedBox(
              height: 10,
            ),
            _textfields('Streat'),
// Text field for House
            const SizedBox(
              height: 10,
            ),
            _textfields('House'),
          ],
        ),
      ),
    );
  }

// text field widget
  Widget _textfields(String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextFormField(
        decoration: InputDecoration(
          labelStyle: const TextStyle(fontSize: 25, color: Colors.green),
          hintText: name,
          labelText: name,
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
      ),
    );
  }
}
