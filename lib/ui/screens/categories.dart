import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instant_services/ui/screens/discriptionscreen.dart';
import 'package:instant_services/ui/screens/veiwallscreen.dart';

class Appcategories extends StatefulWidget {
  const Appcategories({super.key});

  @override
  State<StatefulWidget> createState() {
    return Appcategoriesstate();
  }
}

class Appcategoriesstate extends State {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
// maintanence
        _category("Maintanence", "view All"),
        SizedBox(
          height: 140.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return _catagoritem();
            },
          ),
        ),
// Cleaning
        _category("Cleaning", "View All"),
        SizedBox(
          height: 140.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return _catagoritem();
            },
          ),
        ),
// Home improvment
        _category('Home Improvement', 'view All'),
        SizedBox(
          height: 140.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return _catagoritem();
            },
          ),
        ),
//Security
        _category('Security & CCTV', 'view All'),
        SizedBox(
          height: 140.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return _catagoritem();
            },
          ),
        ),
// other services
        _category('Other Services', 'view All'),
        SizedBox(
          height: 140.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return _catagoritem();
            },
          ),
        ),
      ],
    );
  }

  Widget _category(String title, String viewAll) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          TextButton(
            onPressed: () {
              Get.to(() => const Viewall());
            },
            child: Text(
              viewAll,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.green),
            ),
          ),
        ],
      ),
    );
  }

  Widget _catagoritem() {
    return GestureDetector(
      onTap: () {
        Get.to(() => const Detail());
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 0.5),
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 15,
          child:  const Padding(
            padding: EdgeInsets.all(25.0),
            child: Center(
              child: Column(
                children: <Widget>[
                  Icon(Icons.person),
                  Text('Aneeb'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
