import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instant_services/repository/login_controller.dart';
import 'package:instant_services/ui/screens/Auth/register.dart';

import '../../../models/user_model.dart';
import '../../../shared_pref/shared_prefrence.dart';
import '../home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<StatefulWidget> createState() {
    return Loginstate();
  }
}

class Loginstate extends State {
  // ignore: prefer_typing_uninitialized_variables
  var passwordobs;

  @override
  void initState() {
    super.initState();
    passwordobs = true;
  }

  final formKey = GlobalKey<FormState>();
  //key for form
  @override
  Widget build(BuildContext context) {
    HomeController homecontroller = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Login',
          style: TextStyle(fontSize: 30),
        )),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: homecontroller.loginFormKey,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Image.asset(
                  'assets/image/login.png',
                  height: 300,
                  width: 400,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
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
                  validator: (value) => value!.isEmpty ? 'Enter Email' : null,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
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
                  validator: (value) =>
                      value!.isEmpty ? 'Enter password' : null,
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
                    homecontroller.checkLogin();
                    try {
                      // ignore: unused_local_variable
                      final credential = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                        email: homecontroller.emailController.text,
                        password: homecontroller.passwordController.text,
                      );
                      await SharedPrefClient().setUser(UserModel(
                          credential.user!.uid, credential.user!.email!));
                      Get.offAll(() => const Myhome());
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        Get.snackbar(
                            'Wrong', ' Please Enter Correct Email/Password ',
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                            snackPosition: SnackPosition.BOTTOM);
                        if (kDebugMode) {
                          print('No user found for that email.');
                        }
                      } else if (e.code == 'wrong-password') {
                        if (kDebugMode) {
                          print('Wrong password provided for that user.');
                        }
                        Get.snackbar(
                            'Wrong Password', ' Enter Correct Password ',
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                            snackPosition: SnackPosition.BOTTOM);
                      }
                    }
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 25),
                  )),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Do not have account?'),
                  TextButton(
                    onPressed: () {
                      Get.to(() => const Register());
                    },
                    child: const Text(
                      'Register',
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
