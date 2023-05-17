import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instant_services/models/services_model.dart';
import 'package:instant_services/ui/screens/discriptionscreen.dart';
import 'package:instant_services/ui/screens/veiwallscreen.dart';



class ServiceSection extends StatefulWidget {
  final ServiceModel service;
  const ServiceSection({Key? key,required this.service}) : super(key: key);

  @override
  State<ServiceSection> createState() => _CategorySectionState();
}

class _CategorySectionState extends State<ServiceSection> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
// maintanence
        _category(widget.service.name, "view All"),
        SizedBox(
          height: 140.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.service.product.length,
            itemBuilder: (BuildContext context, int index) {
              return _catagoritem(widget.service.product[index]);
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

  Widget _catagoritem(Product product) {
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
                  Image.network(product.productImage,
                  height: 20,
                    width: 20,
                  ),
                  Text(product.productName),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
