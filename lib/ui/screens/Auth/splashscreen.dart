import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../shared_pref/shared_prefrence.dart';
import '../home.dart';
import 'login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => _afterBuild(context));
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const Spacer(),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset('assets/image/1.png'),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  void _afterBuild(BuildContext context) => _checkInternetAndProceed(context);

  void _checkInternetAndProceed(BuildContext context) async {
    bool falgConnected = false;
    try {
      final result = await InternetAddress.lookup('example.com')
          .timeout(const Duration(seconds: 30));
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        falgConnected = true;
      }
    } catch (_) {}
    if (falgConnected) {
      _checkSessionAndProceed();
      //  _checkLocationAndProceed(context);
    } else {
      // ignore: avoid_print
      print("no internet");
    }
  }

  void _checkSessionAndProceed() async {
    bool status = await SharedPrefClient().isUserLoggedIn();

    if (kDebugMode) {
      print("user login check: $status");
    }
    Timer(const Duration(seconds: 3), () {
      if (status) {
        Get.offAll(() => const Myhome());
      } else {
        Get.offAll(() => const Login());
      }
    });
  }
}
