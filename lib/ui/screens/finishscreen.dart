import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home.dart';

class FinishingScreen extends StatelessWidget {
  const FinishingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

//appbar
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text(' Process Complete'),
        ),
//Bottom button
        bottomNavigationBar: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            border: Border.all(width: 0.2),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => const Myhome());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  elevation: 5,
                ),
                child: const Text(
                  'Finish',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ),
//screen body
        body: const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Congratulations on completing your service request! We extend our heartfelt thanks for choosing our app. We truly appreciate your trust and look forward to serving you again in the future.',
              style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
            ),
          ),
        ));
  }
}
