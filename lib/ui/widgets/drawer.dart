import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instant_services/ui/screens/Auth/login.dart';
import 'package:instant_services/ui/screens/messages.dart';

import '../../shared_pref/shared_prefrence.dart';
import '../screens/feedback.dart';
import '../screens/home.dart';

var mydrawer = Drawer(
  child: Column(
    children: [
      const DrawerHeader(
        decoration: BoxDecoration(
          color: Colors.green,
        ),
        child: Text(
          'INSTANT SERVICES',
          style: TextStyle(
            color: Colors.white,
            fontSize: 31,
          ),
        ),
      ),
      ListTile(
        leading: const Icon(Icons.home),
        title: const Text('H O M E'),
        onTap: () {
          Get.offAll(() => const Myhome());
        },
      ),
      ListTile(
        leading: const Icon(Icons.message_outlined),
        title: const Text('M E S S A G E S'),
        onTap: () {
          Get.to(() => const Messagescreen());
        },
      ),
      ListTile(
        leading: const Icon(Icons.question_mark),
        title: const Text('F E E D B A C K'),
        onTap: () {
          Get.to(() => const Feedbackscreen());
        },
      ),
      ListTile(
        leading: const Icon(Icons.logout_outlined),
        title: const Text('L O G O U T'),
        onTap: () async {
          FirebaseAuth.instance.signOut();
          await SharedPrefClient().clearUser();
          Get.offAll(() => const Login());
        },
      ),
    ],
  ),
);
