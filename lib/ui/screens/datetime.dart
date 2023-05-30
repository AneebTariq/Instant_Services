import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instant_services/ui/screens/formscreen.dart';

import '../../models/services_model.dart';

class DateandTime extends StatefulWidget {
  final Product product;
  final String detail;
  final String? myimageurl;
  const DateandTime(
      {super.key,
      required this.product,
      required this.detail,
      required this.myimageurl});

  @override
  State<DateandTime> createState() => DateandTimestate();
}

class DateandTimestate extends State<DateandTime> {
  //Date picker
  DateTime datetime = DateTime.now();
  void _selectdate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    ).then((value) {
      setState(() {
        datetime = value!;
      });
    });
  }

  //Time picker
  TimeOfDay mytime = TimeOfDay.now();
  void _timepicker() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      setState(() {
        mytime = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
//Item lists
    return Scaffold(
      appBar: AppBar(
        title: const Text('Date And Time'),
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
      //botum sheet
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
                Get.to(() => Formdetail(
                      detail: widget.detail,
                      myimageurl: widget.myimageurl!,
                      product: widget.product,
                      servicedate: datetime,
                      servicetime: mytime,
                    ));
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
      body: Column(children: <Widget>[
        const SizedBox(
          height: 30,
        ),
        //time picker
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Card(
            elevation: 10,
            child: ListTile(
              leading: const Icon(
                Icons.timer,
                color: Colors.green,
              ),
              title: Text("${mytime.hour}:${mytime.minute}"),
              trailing: ElevatedButton(
                onPressed: _timepicker,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: const Text('Select Time'),
              ),
            ),
          ),
        ),
        //Date card
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Card(
            elevation: 10,
            child: ListTile(
              leading: const Icon(
                Icons.calendar_month,
                color: Colors.green,
              ),
              title: Text("${datetime.day}/${datetime.month}/${datetime.year}"),
              trailing: ElevatedButton(
                onPressed: _selectdate,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: const Text('Select Date'),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
