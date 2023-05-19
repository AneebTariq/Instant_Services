// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class ServiceRequest {
  final String? id;
  final String service_name;
  final String service_image;
  final String service_detail;
  final String service_date;
  final String service_time;
  final String service_city;
  final String user_name;
  final String user_number;
  final String user_address;
  final String user_email;

  const ServiceRequest({
    this.id,
    required this.service_name,
    required this.service_image,
    required this.service_detail,
    required this.service_date,
    required this.service_time,
    required this.service_city,
    required this.user_address,
    required this.user_email,
    required this.user_name,
    required this.user_number,
  });
  tojason() {
    return {
      'service_name': service_name,
      'service_image': service_image,
      'service_detail': service_detail,
      'service_date': service_date,
      'service_time': service_time,
      'services_city': service_city,
      'user_address': user_address,
      'user_email': user_email,
      'user_name': user_name,
      'user_number': user_number,
    };
  }

  factory ServiceRequest.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return ServiceRequest(
      id: document.id,
      service_name: data['service_name'],
      service_image: data['service_image'],
      service_detail: data['service_detail'],
      service_date: data['service_date'],
      service_time: data['service_time'],
      service_city: data['service_city'],
      user_address: data['user_address'],
      user_email: data['user_email'],
      user_name: data['user_name'],
      user_number: data['user_number'],
    );
  }
}
