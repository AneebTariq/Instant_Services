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
        title: const Text('Messages'),
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        centerTitle: true,
      ),
      // bottomNavigationBar: IconButton(
      //   icon: const Icon(
      //     Icons.chat_bubble_outline_outlined,
      //     color: Colors.blue,
      //   ),
      //   onPressed: () {
      //     Get.to(() => const OrderChatPage(
      //           requestId: 1,
      //           theirName: "Admin",
      //         ));
      //   },
      // ),
      body: Stack(
        children: [
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              onPressed: () {
                Get.to(() => const OrderChatPage(
                      requestId: "DdPZPtPFrhcfPJT6Esk3lYSFlIh1",
                      theirName: "Admin",
                    ));
              },
              tooltip: 'Chat',
              backgroundColor: Colors.green,
              child: const Icon(Icons.chat_bubble_outline_outlined),
            ),
          )
        ],
      ),
    );
  }
}
