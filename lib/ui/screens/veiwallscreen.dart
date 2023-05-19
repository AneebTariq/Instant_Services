import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instant_services/models/services_model.dart';
import 'package:instant_services/ui/screens/discriptionscreen.dart';

class Viewall extends StatefulWidget {
  const Viewall(List<Product> product, {super.key});

  @override
  State<Viewall> createState() => _ViewallState();
}

class _ViewallState extends State<Viewall> {
  @override
  Widget build(BuildContext context) {
    List product = Product as List;
    return Scaffold(
//appbar
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('maintanence'),
        actions: const [
          Icon(Icons.all_inbox_outlined),
          SizedBox(
            width: 20,
          ),
        ],
      ),
// screen body
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
          ),
          itemCount: product.length,
          itemBuilder: (BuildContext ctx, index) {
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
                  child: const Padding(
                    padding: EdgeInsets.all(25.0),
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          // Image.network(
                          //   product.productImage,
                          //   height: 30,
                          //   width: 30,
                          // ),
                          // const SizedBox(
                          //   height: 10,
                          // ),
                          // Text(product.productName),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
