import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instant_services/ui/screens/formscreen.dart';
import '../../models/services_model.dart';
import 'datetime.dart';

class Order extends StatefulWidget {
  final Product product;
  final String detail;
  final String? myimageurl;
  const Order(
      {super.key,
      required this.product,
      required this.detail,
      required this.myimageurl});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//appbar
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text('Schedule your service'),
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
                            DateTime date = DateTime.now();
                            TimeOfDay time = TimeOfDay.now();
                            print(date);
                            Get.to(() => Formdetail(
                                  detail: widget.detail,
                                  myimageurl: widget.myimageurl!,
                                  product: widget.product,
                                  servicedate: date,
                                  servicetime: time,
                                ));
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
                          onPressed: () {
                            Get.to(() => DateandTime(
                                  detail: widget.detail,
                                  myimageurl: widget.myimageurl!,
                                  product: widget.product,
                                ));
                          },
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
        body: const Center(
          child: Padding(
            padding: EdgeInsets.only(left: 30, right: 20, bottom: 50),
            child: Text(
              'When would you like us to send Technician?',
              style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
            ),
          ),
        ));
  }
}
