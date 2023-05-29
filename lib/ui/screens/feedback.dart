import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instant_services/repository/maincontroller.dart';

class Feedbackscreen extends StatefulWidget {
  const Feedbackscreen({super.key});

  @override
  State<Feedbackscreen> createState() => _FeedbackscreenState();
}

class _FeedbackscreenState extends State<Feedbackscreen> {
  User? user = FirebaseAuth.instance.currentUser;
  Maincontroller maincontroller = Get.put(Maincontroller());
  String myfeedback = '';
  final chatFieldBorder = OutlineInputBorder(
    borderSide: const BorderSide(
      width: 1,
      color: Colors.green,
    ),
    borderRadius: BorderRadius.circular(25.0),
  );
  @override
  Widget build(BuildContext context) {
    String? useremail = user!.email;

    final Query<Map<String, dynamic>> usersCollection = FirebaseFirestore
        .instance
        .collection('Feedback')
        .where('Email', isEqualTo: useremail);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Give Feedback'),
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
      bottomSheet: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: maincontroller.servicefeedback,
                  decoration: InputDecoration(
                    hintText: 'Send Message',
                    border: chatFieldBorder,
                    focusedBorder: chatFieldBorder,
                  ),
                ),
              ),
              GestureDetector(
                child: const SizedBox(
                  width: 48,
                  child: Icon(
                    Icons.send,
                    color: Colors.green,
                    size: 20,
                  ),
                ),
                onTap: () async {
                  myfeedback = maincontroller.servicefeedback.text;

                  // Insert data into Firestore
                  await FirebaseFirestore.instance
                      .collection('Feedback')
                      .add({'userfeedback': myfeedback, 'Email': useremail});

                  maincontroller.servicefeedback.clear();
                },
              ),
            ],
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: usersCollection.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text(snapshot.data!.docs[index]['userfeedback']),
                        ],
                      ),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
