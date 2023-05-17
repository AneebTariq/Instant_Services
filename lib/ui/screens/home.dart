import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instant_services/ui/screens/categories.dart';
import 'package:instant_services/ui/widgets/drawer.dart';
import 'package:instant_services/ui/widgets/navbar.dart';

import '../../models/services_model.dart';

class Myhome extends StatefulWidget {
  const Myhome({super.key});

  @override
  State<StatefulWidget> createState() {
    return Myhomestate();
  }
}

class Myhomestate extends State {



  @override
  void initState() {
   // fetchData();
    // TODO: implement initState
    super.initState();
  }

  Future<List<ServiceModel>> fetchData() async {
    // Replace 'yourCollectionPath' with the actual path to your collection in Firestore
    CollectionReference collectionRef = FirebaseFirestore.instance.collection('services');
    List<ServiceModel>  serviceList=[];
    try {
      QuerySnapshot querySnapshot = await collectionRef.get();



      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {

        // Access the document data
        Map<String, dynamic> documentData = documentSnapshot.data() as Map<String, dynamic>;

        // Create a Document instance
        ServiceModel service = ServiceModel.fromMap(documentData);

        // Add the document to the list
        serviceList.add(service);

      }
    } catch (e) {
      // Handle any errors that occur
      print('Error: $e');
    }

    return serviceList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//app bar
        appBar: AppBar(
          elevation: 5,
          title: const Text('Instant Services'),
          backgroundColor: Colors.green,
        ),
// user profile drawer
        drawer: mydrawer,
// Bottom Navigation bar
        bottomNavigationBar: const Mynavbar(),
//screen body
        body: FutureBuilder<List<ServiceModel>>(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              return ListView(
                children: <Widget>[
// Search bar
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 15.0,
                    ),
                    child: TextField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        hintText: 'Enter Services that you want....',
                        hintStyle: const TextStyle(color: Colors.black87),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: Colors.green)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
// offer card
            const Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: Card(
                elevation: 2.0,
                child: ListTile(
                  leading: Text(
                    'Offers',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
            ),
// Home Slider
            CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 1,
                viewportFraction: 0.7,
                autoPlay: true,
                enlargeCenterPage: true,
                height: 150.0,
              ),
              items: _imgurl.map((a) {
                return Builder(
                  builder: (BuildContext context) {
                    return SizedBox(
                      child: Image.asset(a),
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(
              height: 10,
            ),
//categories of sevices page linked
                  ServiceSection(service: snapshot.data![0]),
                  const SizedBox(
                    height: 10,
                  ),
                  ServiceSection(service: snapshot.data![1]),
                ],
              );
            }
          }
        ));
  }

//slider images
  final List _imgurl = [
    'assets/image/1.png',
    'assets/image/2.png',
    'assets/image/3.jpg',
  ];
}
