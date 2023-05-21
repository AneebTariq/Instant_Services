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
  String imageurl = '';

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
                      myimageurl: maincontroller.imageurl.toString(),
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
        title: const Text('Discribe Problem'),
        backgroundColor: Colors.green,
      ),
//Body of screen
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
//Text Field for Discreption
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 15, right: 20),
            child: TextFormField(
              maxLines: null,
              minLines: 6,
              controller: maincontroller.servicedetail,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                hintText: 'Enter detailes....',
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
          ),
          Center(child: Text(widget.product.productName)),
//Add Image option
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Add Image',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 5,
                            ),
                            title: ListTile(
                              leading: const Icon(Icons.camera),
                              title: const Text('Open camera'),
                              onTap: () async {
                                /*Step 1:Pick image*/
                                //Install image_picker
                                //Import the corresponding library

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
                                  imageurl = await referenceImageToUpload
                                      .getDownloadURL();
                                } catch (error) {
                                  //Some error occurred
                                }
                              },
                            ),
                            content: ListTile(
                              leading: const Icon(Icons.browse_gallery_rounded),
                              title: const Text('Open gallery'),
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

                                /*Step 2: Upload to Firebase storage*/
                                //Install firebase_storage
                                //Import the library

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
                                } catch (error) {
                                  //Some error occurred
                                }
                              },
                            ),
                            actions: const [],
                          );
                        },
                      );
                    },
                    child: const Icon(
                      Icons.image,
                      color: Colors.grey,
                      size: 40,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
