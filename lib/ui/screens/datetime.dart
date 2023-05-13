import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instant_services/ui/screens/formscreen.dart';

class DateandTime extends StatefulWidget {
  const DateandTime({super.key});

  @override
  State<StatefulWidget> createState() {
    return DateandTimestate();
  }
}

class DateandTimestate extends State {
  @override
  Widget build(BuildContext context) {
//Item lists
    return Scaffold(
      appBar: AppBar(
        title: const Text('Date And Time'),
        backgroundColor: Colors.green,
      ),
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
                Get.to(() => Formdetail());
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
      body:  Column(
        children: <Widget>[Text('Date and Time')],
      ),
    );
  }
}
