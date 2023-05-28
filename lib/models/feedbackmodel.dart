// ignore_for_file: non_constant_identifier_names
import 'package:cloud_firestore/cloud_firestore.dart';

class Feedback {
  final String? id;
  final String? userfeedback;
  final String? Email;

  const Feedback({
    this.id,
    required this.userfeedback,
    required this.Email,
  });
  tojason() {
    return {
      'userfeedback': userfeedback,
      'Email': Email,
    };
  }

  factory Feedback.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return Feedback(
      id: document.id,
      userfeedback: data['userfeedback'],
      Email: data['Email'],
    );
  }
}
