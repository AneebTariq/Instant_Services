import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instant_services/ui/screens/datetime.dart';

class Maincontroller extends GetxController {
  TextEditingController servicedetail = TextEditingController();
  TextEditingController servicefeedback = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  TimeOfDay? selectedtime;
  DateandTime? selecteddate;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    servicedetail = TextEditingController();
    servicefeedback = TextEditingController();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    servicedetail.dispose();
    servicefeedback.dispose();
  }
}
