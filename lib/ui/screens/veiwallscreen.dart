import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instant_services/models/services_model.dart';
import 'package:instant_services/ui/screens/discriptionscreen.dart';

class Viewall extends StatefulWidget {
  final ServiceModel service;
  Viewall(this.service, {super.key});

  @override
  State<Viewall> createState() => _ViewallState();
}

class _ViewallState extends State<Viewall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//appbar
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(widget.service.name),
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
          itemCount: widget.service.product.length,
          itemBuilder: (BuildContext ctx, index) {
            return GestureDetector(
              onTap: () {
                Get.to(
                    () => DetailScreen(product: widget.service.product[index]));
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 15,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Image.network(
                            widget.service.product[index].productImage,
                            height: 30,
                            width: 30,
                          ),
                          Text(widget.service.product[index].productName),
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
