import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'chat_screen.dart';

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
      bottomNavigationBar: IconButton(icon: Icon(Icons.chat_bubble_outline_outlined,color: Colors.blue,),onPressed: (){


        Get.to(()=>OrderChatPage(requestId: 1,theirName: "Admin",));

      },),
    );
  }
}
