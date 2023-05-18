import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instant_services/ui/screens/aboutus.dart';

class Mynavbar extends StatefulWidget {
  const Mynavbar({super.key});

  @override
  State<StatefulWidget> createState() {
    return Mynavbarstate();
  }
}

class Mynavbarstate extends State {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5), topRight: Radius.circular(5))),
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10.0,
              ),
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  Text(
                    'Home',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: sqrt1_2,
                    ),
                  )
                ],
              ),
            ),
            // about us
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10.0,
              ),
              child: InkWell(
                onTap: () {
                  Get.to(() => const Aboutscreen());
                },
                child: const Column(
                  children: <Widget>[
                    Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    Text(
                      'About US',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: sqrt1_2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // All services
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10.0,
              ),
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.category_outlined,
                    color: Colors.white,
                  ),
                  Text(
                    'All Services',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: sqrt1_2,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
