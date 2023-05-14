import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:instant_services/ui/screens/categories.dart';
import 'package:instant_services/ui/widgets/drawer.dart';
import 'package:instant_services/ui/widgets/navbar.dart';

class Myhome extends StatefulWidget {
  const Myhome({super.key});

  @override
  State<StatefulWidget> createState() {
    return Myhomestate();
  }
}

class Myhomestate extends State {
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
        body: ListView(
          children: <Widget>[
// Search bar
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
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
            const Appcategories(),
          ],
        ));
  }

//slider images
  final List _imgurl = [
    'assets/image/1.png',
    'assets/image/2.png',
    'assets/image/3.jpg',
  ];
}
