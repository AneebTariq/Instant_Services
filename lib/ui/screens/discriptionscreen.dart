// ignore_for_file: avoid_print

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instant_services/ui/screens/addmoreitem.dart';
import '../../models/services_model.dart';
import '../../repository/maincontroller.dart';

class DetailScreen extends StatefulWidget {
  final Product product;

  const DetailScreen({required this.product, Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Maincontroller maincontroller = Get.put(Maincontroller());
  // String imageurl = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//Bottom Button
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
                Get.to(() => AddMore(
                      product: widget.product,
                      myimageurl: maincontroller.imageurl!,
                      detail: maincontroller.servicedetail.text,
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
//Appbar
      appBar: AppBar(
        title: const Text(''
            'Describe Problem'),
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
//Body of screen
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          child: Column(
            //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //Text Field for Discreption

              Row(
                children: [
                  const Text(
                    "Selected Service: ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.product.productName,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),

              const SizedBox(
                height: 20,
              ),

              const Text(
                "Detail: ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                maxLines: null,
                minLines: 6,
                controller: maincontroller.servicedetail,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Enter Detail....',
                  hintStyle: const TextStyle(color: Colors.black87),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.green)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              // Center(child: Text(widget.product.productName)),
              //Add Image option
              const SizedBox(
                height: 25,
              ),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Center(
                    child: Container(
                      alignment: Alignment.center,
                      height: 200,
                      width: 200,
                      child: maincontroller.imageurl != ''
                          ? Image.network(maincontroller.imageurl!)
                          : const Placeholder(),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 5,
                                ),
                                title: Column(children: [
                                  GestureDetector(
                                    onTap: () async {
                                      ImagePicker imagePicker = ImagePicker();
                                      XFile? file = await imagePicker.pickImage(
                                          source: ImageSource.camera);
                                      print('${file?.path}');

                                      if (file == null) return;
                                      //Import dart:core
                                      // ignore: unused_local_variable
                                      String uniqueFileName = DateTime.now()
                                          .millisecondsSinceEpoch
                                          .toString();

                                      /*Step 2: Upload to Firebase storage*/

                                      //Get a reference to storage root
                                      Reference referenceRoot =
                                          FirebaseStorage.instance.ref();
                                      Reference referenceDirImages =
                                          referenceRoot.child('images');

                                      //Create a reference for the image to be stored
                                      Reference referenceImageToUpload =
                                          referenceDirImages.child('name');

                                      //Handle errors/success
                                      try {
                                        //Store the file
                                        await referenceImageToUpload
                                            .putFile(File(file.path));

                                        //Success: get the download URL
                                        maincontroller.imageurl =
                                            await referenceImageToUpload
                                                .getDownloadURL();

                                        //Navigator.of(context).pop();
                                        setState(() {});
                                      } catch (error) {
                                        //Some error occurred
                                      }
                                      // ignore: use_build_context_synchronously
                                    },
                                    child: const Row(
                                      children: [
                                        Icon(Icons.camera),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Text(
                                          'Open Camera',
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      ImagePicker imagePicker = ImagePicker();
                                      XFile? file = await imagePicker.pickImage(
                                          source: ImageSource.gallery);
                                      print('${file?.path}');

                                      if (file == null) return;
                                      //Import dart:core
                                      // ignore: unused_local_variable
                                      String uniqueFileName = DateTime.now()
                                          .millisecondsSinceEpoch
                                          .toString();

                                      //Get a reference to storage root
                                      Reference referenceRoot =
                                          FirebaseStorage.instance.ref();
                                      Reference referenceDirImages =
                                          referenceRoot.child('images');

                                      //Create a reference for the image to be stored
                                      Reference referenceImageToUpload =
                                          referenceDirImages.child('name');

                                      //Handle errors/success
                                      try {
                                        //Store the file
                                        await referenceImageToUpload
                                            .putFile(File(file.path));
                                        //Success: get the download URL
                                        maincontroller.imageurl =
                                            await referenceImageToUpload
                                                .getDownloadURL();
                                        setState(() {});
                                      } catch (error) {
                                        //Some error occurred
                                      }
                                    },
                                    child: const Row(
                                      children: [
                                        Icon(Icons.browse_gallery),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Text(
                                          'Open Gallery',
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]));
                          });
                    },
                    icon: const Icon(Icons.add_a_photo),
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
