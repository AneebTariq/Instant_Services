import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Drawer extends StatelessWidget {
  const Drawer({super.key, required ListView child});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add your drawer content here
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Drawer Header',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              // Handle item 1 tap
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.message_outlined),
            title: const Text('Messages'),
            onTap: () {
              // Handle item 2 tap
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.question_mark),
            title: const Text('Help'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.logout_outlined),
            title: const Text('Logout'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
