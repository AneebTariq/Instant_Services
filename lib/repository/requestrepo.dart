import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instant_services/ui/screens/home.dart';

import '../models/servicerequestmodel.dart';

class Servicerepository {
  static Servicerepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  // ignore: non_constant_identifier_names
  CreateDonor(ServiceRequest request) async {
    await _db
        .collection('ServiceRequest')
        .add(request.tojason())
        .whenComplete(() {
      Get.snackbar(
        'Success',
        'your data saved',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      Get.off(() => const Myhome());
      // ignore: body_might_complete_normally_catch_error
    }).catchError((error, stackTrace) {
      Get.snackbar(
        'Error',
        'Someting went wrong. Try Again',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      // ignore: avoid_print
      print(error.toString());
    });
  }

// tofetch all user data
  Future<List<ServiceRequest>> alluser() async {
    final snapshot = await _db.collection('ServiceRequest').get();
    final userdata =
        snapshot.docs.map((e) => ServiceRequest.fromSnapshot(e)).toList();
    return userdata;
  }

  //fetch data of one user
  Future<ServiceRequest> getuserdetail(String name) async {
    final snapshot = await _db
        .collection('ServiceRequest')
        .where('Name', isEqualTo: name)
        .get();
    final userdata =
        snapshot.docs.map((e) => ServiceRequest.fromSnapshot(e)).single;
    return userdata;
  }
}
