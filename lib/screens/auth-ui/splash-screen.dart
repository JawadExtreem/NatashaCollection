import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:natasha_collection/screens/auth-ui/welcome-screen.dart';
import 'package:natasha_collection/screens/user-panel/main-screen.dart';
import 'package:natasha_collection/utils/app-constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      Get.offAll(() => WelcomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppConstant.appSecondryColor,
      appBar: AppBar(
        backgroundColor: AppConstant.appSecondryColor,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: Get.width,
                alignment: Alignment.center,
                child: Lottie.asset('assets/images/splash-icon.json'),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 40),
              width: Get.width,
              alignment: Alignment.center,
              child: Text(
                AppConstant.appPowerdBy,
                style: TextStyle(
                    color: AppConstant.appTextColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
