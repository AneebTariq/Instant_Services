import 'package:flutter/material.dart';

var mydrawer = Drawer(
  child: Column(
    children: [
      const DrawerHeader(
        decoration: BoxDecoration(
          color: Colors.green,
        ),
        child: Text(
          'I N S T A N T     S E R V I C E S',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
      ListTile(
        leading: const Icon(Icons.home),
        title: const Text('H O M E'),
        onTap: () {
          // Handle item 1 tap
        },
      ),
      ListTile(
        leading: const Icon(Icons.message_outlined),
        title: const Text('M E S S A G E S'),
        onTap: () {
          // Handle item 2 tap
        },
      ),
      ListTile(
        leading: const Icon(Icons.question_mark),
        title: const Text('H E L P'),
        onTap: () {},
      ),
      ListTile(
        leading: const Icon(Icons.logout_outlined),
        title: const Text('L O G O U T'),
        onTap: () {},
      ),
    ],
  ),
);
