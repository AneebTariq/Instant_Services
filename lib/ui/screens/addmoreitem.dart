import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instant_services/ui/screens/home.dart';

import 'orderscreen.dart';

class AddMore extends StatefulWidget {
  const AddMore({super.key});

  @override
  State<StatefulWidget> createState() {
    // ignore: todo
    // TODO: implement createState
    return AddMorestate();
  }
}

class AddMorestate extends State {
  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return Scaffold(
//appbar
      appBar: AppBar(
        title: const Text('Add More'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => const Myhome());
            },
            icon: const Icon(Icons.add),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
// botom button
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
                Get.to(() => const Order());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                elevation: 5,
              ),
              child: const Text(
                'Continue',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
      ),
//Body of screen listview
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 160,
              child:  const Card(
                elevation: 5,
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text('Title'),
                      subtitle: Text('data'),
                      trailing: Icon(Icons.delete),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // const Spacer(
          //   flex: 2,
          // ),
        ],
      ),
    );
  }
}
