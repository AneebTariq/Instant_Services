// ignore_for_file: prefer_interpolation_to_compose_strings
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ActiveOrder extends StatefulWidget {
  const ActiveOrder({super.key});

  @override
  State<ActiveOrder> createState() => _ActiveOrderState();
}

class _ActiveOrderState extends State<ActiveOrder> {
  String myString = '';

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<SharedPreferences> getSharedPreferencesInstance() async {
    return await SharedPreferences.getInstance();
  }

  Future<void> getData() async {
    SharedPreferences prefs = await getSharedPreferencesInstance();
    myString = prefs.getString('email') ?? '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    String myuser = myString;
    String mystatus = 'pending';
    final Query<Map<String, dynamic>> usersCollection = FirebaseFirestore
        .instance
        .collection('ServiceRequest')
        .where('User_email', isEqualTo: myuser)
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
                            trailing:
                                Text(snapshot.data!.docs[index]['status']),
                            title: Text('Service_name: ' +
                                snapshot.data!.docs[index]['service_name']),
                            subtitle: Text('service Date and Time: ' +
                                snapshot.data!.docs[index]['service_date'] +
                                '  ' +
                                snapshot.data!.docs[index]['service_time']),
                          ),
                          // Text('User_email: ' +
                          //     snapshot.data!.docs[index]['User_email']),
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
