import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instant_services/repository/maincontroller.dart';

import '../../models/services_model.dart';
import 'finishscreen.dart';

class Formdetail extends StatefulWidget {
  final Product product;
  final String? detail;
  final String myimageurl;
  final DateTime servicedate;
  final TimeOfDay servicetime;
  const Formdetail({
    super.key,
    required this.product,
    required this.detail,
    required this.myimageurl,
    required this.servicedate,
    required this.servicetime,
  });

  @override
  State<Formdetail> createState() => _FormdetailState();
}

class _FormdetailState extends State<Formdetail> {
  final _formKey = GlobalKey<FormState>();
  Maincontroller maincotroller = Get.put(Maincontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//Bottom button
      bottomNavigationBar: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            border: Border.all(width: 0.2),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
          ),
          padding: const EdgeInsets.all(20.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            child: const Text(
              'Continue',
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Get.to(() => FinishingScreen(
                      address: maincotroller.address.text,
                      product: widget.product,
                      myimageurl: widget.myimageurl,
                      detail: widget.detail,
                      servicedate: widget.servicedate,
                      servicetime: widget.servicetime,
                      city: maincotroller.city.text,
                      name: maincotroller.name.text,
                      number: maincotroller.number.text,
                    ));
              }
            },
          )),
//Appbar
      appBar: AppBar(
        title: const Text('Location'),
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
// Screen Body
      body: SingleChildScrollView(
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  controller: maincotroller.name,
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(fontSize: 25, color: Colors.green),
                    hintText: 'Enter name',
                    labelText: 'Name',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: maincotroller.number,
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(fontSize: 25, color: Colors.green),
                    hintText: 'Enter Number',
                    labelText: 'Number',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              //Text field for city
              const SizedBox(
                height: 10,
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  controller: maincotroller.city,
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(fontSize: 25, color: Colors.green),
                    hintText: 'Enter city name',
                    labelText: 'City',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20.0, top: 20),
                child: Text(
                  'Address',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.green,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 15, right: 20),
                child: TextFormField(
                  maxLines: null,
                  minLines: 6,
                  controller: maincotroller.address,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: 'Enter Address....',
                    hintStyle: const TextStyle(color: Colors.black87),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.green)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
