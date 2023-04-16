import 'package:flutter/material.dart';
import 'package:instant_services/ui/screens/formscreen.dart';

class Order extends StatelessWidget {
  const Order({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//appbar
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text('Schedule your service'),
        ),
//Bottom button
        bottomNavigationBar: Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              border: Border.all(width: 0.2),
            ),
            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Formdetail(),
                              ),
                            );
                          },
                          child: const Text(
                            'Now ',
                            style: TextStyle(
                              fontSize: 26,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.greenAccent,
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Schedule for later ',
                            style: TextStyle(
                              fontSize: 26,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ]))),
//screen body
        body: const Padding(
          padding: EdgeInsets.only(left: 30, right: 20, bottom: 50),
          child: Center(
            child: Text(
              'When would you like us to send Technician?',
              style: TextStyle(fontSize: 30),
            ),
          ),
        ));
  }
}
