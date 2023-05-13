import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/user_model.dart';
import '../../../repository/login_controller.dart';
import '../../../shared_pref/shared_prefrence.dart';
import '../home.dart';
import 'login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<StatefulWidget> createState() {
    return Registerstate();
  }
}

class Registerstate extends State {
  HomeController homecontroller = Get.put(HomeController());

  late bool passwordobs;

  @override
  void initState() {
    super.initState();
    passwordobs = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Register',
          style: TextStyle(fontSize: 30),
        )),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: homecontroller.registerFormKey,
          child: Column(
            children: <Widget>[
              // Padding(
              //   padding: const EdgeInsets.only(top: 20.0),
              //   child: Image.asset(
              //     'assets/images/accept.png',
              //     height: 300,
              //   ),
              // ),
              const SizedBox(
                height: 200,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  validator: (value) => value!.isEmpty ? 'Enter Email' : null,
                  controller: homecontroller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  focusNode: FocusNode(),
                  autofocus: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    hintText: 'Your Email',
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Icon(
                        Icons.person,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  validator: (value) =>
                      value!.isEmpty ? 'Enter password' : null,
                  controller: homecontroller.passwordController,
                  keyboardType: TextInputType.name,
                  obscureText: passwordobs,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    hintText: 'Password',
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Icon(
                        Icons.lock,
                        color: Colors.green,
                      ),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            passwordobs = !passwordobs;
                          });
                        },
                        icon: passwordobs
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    fixedSize: const Size(300, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onPressed: () async {
                    homecontroller.checkregister();
                    try {
                      final credential = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: homecontroller.emailController.text,
                        password: homecontroller.passwordController.text,
                      );
                      await SharedPrefClient().setUser(UserModel(
                          credential.user!.uid, credential.user!.email!));
                      Get.offAll(() => const Myhome());
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        if (kDebugMode) {
                          print('The password provided is too weak.');
                        }
                        Get.snackbar('Weak Password', ' Enter Strong Password ',
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                            snackPosition: SnackPosition.BOTTOM);
                      } else if (e.code == 'email-already-in-use') {
                        if (kDebugMode) {
                          print('The account already exists for that email.');
                        }
                        Get.snackbar('Wrong Email', ' Enter another Email ',
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                            snackPosition: SnackPosition.BOTTOM);
                      }
                    } catch (e) {
                      if (kDebugMode) {
                        print(e);
                      }
                    }
                  },
                  child: const Text(
                    ' R e g i s t e r ',
                    style: TextStyle(fontSize: 25),
                  )),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Allready have account?'),
                  TextButton(
                    onPressed: () {
                      Get.to(() => const Login());
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
