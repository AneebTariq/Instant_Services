// ignore_for_file: prefer_interpolation_to_compose_strings
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActiveOrder extends StatefulWidget {
  const ActiveOrder({super.key});

  @override
  State<ActiveOrder> createState() => _ActiveOrderState();
}

class _ActiveOrderState extends State<ActiveOrder> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    String? myuser = user!.email;
    String mystatus = 'aproved';
    final Query<Map<String, dynamic>> usersCollection = FirebaseFirestore
        .instance
        .collection('ServiceRequest')
        .where('user_email', isEqualTo: myuser)
        .where('status', isEqualTo: mystatus);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Active Order'),
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ListTile(
                            textColor: Colors.black,
                            trailing: ElevatedButton(
                              onPressed: () {
                                String requeststatus = 'Cencel';
                                String mydate =
                                    snapshot.data!.docs[index]['service_date'];
                                String mytime =
                                    snapshot.data!.docs[index]['service_time'];
                                // String myemail =
                                //     snapshot.data!.docs[index]['user_email'];
                                FirebaseFirestore.instance
                                    .collection('ServiceRequest')
                                    .where('service_date', isEqualTo: mydate)
                                    .where('service_time', isEqualTo: mytime)
                                    .where('user_email', isEqualTo: myuser)
                                    .get()
                                    .then((querySnapshot) {
                                  querySnapshot.docs
                                      // ignore: avoid_function_literals_in_foreach_calls
                                      .forEach((documentSnapshot) {
                                    documentSnapshot.reference
                                        .update({'status': requeststatus});
                                  });
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.redAccent,
                              ),
                              child: const Text('Cencel Service'),
                            ),
                            // Text(snapshot.data!.docs[index]['status']),
                            title: Text('Service_name: ' +
                                snapshot.data!.docs[index]['service_name']),
                            subtitle: Text('service Date and Time: ' +
                                snapshot.data!.docs[index]['service_date'] +
                                '  ' +
                                snapshot.data!.docs[index]['service_time']),
                          ),
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
