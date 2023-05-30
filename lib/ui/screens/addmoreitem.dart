import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/services_model.dart';
import 'orderscreen.dart';

class AddMore extends StatefulWidget {
  final Product product;
  final String detail;
  final String? myimageurl;
  const AddMore(
      {required this.product,
      required this.myimageurl,
      required this.detail,
      Key? key})
      : super(key: key);

  @override
  State<AddMore> createState() => _AddMorestate();
}

class _AddMorestate extends State<AddMore> {
  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build

    return Scaffold(
//appbar
      appBar: AppBar(
        title: const Text('Problem Detail'),
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
// botom button
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          border: Border.all(width: 0.2),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ElevatedButton(
              onPressed: () {
                Get.to(() => Order(
                      product: widget.product,
                      myimageurl: widget.myimageurl!,
                      detail: widget.detail,
                    ));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                elevation: 5,
              ),
              child: const Text(
                'Continue',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
      ),
//Body of screen listview
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            children: [
                              Text("Selected Service: ",
                                style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                              ),
                              Text(widget.product.productName,
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            children: [
                              Text("Problem Description: ",
                                style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                              ),


                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(widget.detail,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        //   child: RichText(
                        //     text: TextSpan(
                        //       style: const TextStyle(
                        //           color: Colors.black, fontSize: 16),
                        //       children: <TextSpan>[
                        //         TextSpan(text: widget.detail),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text("Problem Image: ",
                            style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: SizedBox(
                              height: 200,
                              width: 200,
                              child: widget.myimageurl!= ''
                                  ? Image.network(widget.myimageurl!)
                                  : Placeholder(),

                              //Image.network(widget.myimageurl!)),
                        )),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // const Spacer(
            //   flex: 2,
            // ),
          ],
        ),
      ),
    );
  }
}
