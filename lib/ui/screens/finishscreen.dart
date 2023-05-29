import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instant_services/shared_pref/shared_prefrence.dart';
import 'package:intl/intl.dart';
import '../../models/servicerequestmodel.dart';
import '../../models/services_model.dart';
import '../../repository/requestrepo.dart';
import 'home.dart';

class FinishingScreen extends StatefulWidget {
  final Product product;
  final String? detail;
  final String myimageurl;
  final DateTime servicedate;
  final TimeOfDay servicetime;
  final String city;
  final String name;
  final String number;
  final String address;
  const FinishingScreen({
    super.key,
    required this.product,
    required this.detail,
    required this.myimageurl,
    required this.servicedate,
    required this.city,
    required this.name,
    required this.number,
    required this.address,
    required this.servicetime,
  });

  @override
  State<FinishingScreen> createState() => _FinishingScreenState();
}

class _FinishingScreenState extends State<FinishingScreen> {
  User? user = FirebaseAuth.instance.currentUser;

  Future<void> storeDataInFirestore() async {
    try {
      // Create a reference to the collection
      CollectionReference collection =
          FirebaseFirestore.instance.collection('ServiceRequest');

      // Create a new document with a unique ID
      DocumentReference document = collection.doc();

      // Set the data for the document
      await document.set({});

      print('Data added successfully!');
    } catch (e) {
      print('Error adding data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    String? email = user!.email;
    return Scaffold(
//appbar
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(' Process Complete'),
      ),
//Bottom button
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
              onPressed: () async {
                var uId=await SharedPrefClient().getUser();
                String formateddate =
                    DateFormat.yMMMMd().format(widget.servicedate);
                String formatedtime = widget.servicetime.format(context);
                // String formatedtime = widget.servicetime.toString();
                final request = ServiceRequest(
                  service_name: widget.product.productName,
                  service_image: widget.myimageurl,
                  service_detail: widget.detail,
                  service_date: formateddate,
                  service_time: formatedtime,
                  service_city: widget.city,
                  user_name: widget.name,
                  user_number: widget.number,
                  user_address: widget.address,
                  user_email: email,
                  status: 'pending',
                  uId:uId.userId
                );
                await Servicerepository().CreateDonor(request);

                Get.to(() => const Myhome());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                elevation: 5,
              ),
              child: const Text(
                'Finish',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
      ),
//screen body
      body: const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Congratulations on completing your service request! We extend our heartfelt thanks for choosing our app. We truly appreciate your trust and look forward to serving you again in the future.',
            style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
          ),
        ),
      ),
    );
  }
}
