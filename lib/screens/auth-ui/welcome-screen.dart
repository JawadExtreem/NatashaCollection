import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:natasha_collection/utils/app-constant.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppConstant.appSecondryColor,
        title: Text(
          'Welcome To Natasha-Collection',
          style: TextStyle(color: AppConstant.appTextColor),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Lottie.asset('assets/images/splash-icon.json'),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Text(
                'Happy Shopping',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: Get.height / 12,
            ),
            Material(
              child: Container(
                width: Get.width / 1.2,
                height: Get.height / 12,
                decoration: BoxDecoration(
                    color: AppConstant.appSecondryColor,
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton.icon(
                    icon: Image.asset(
                      'assets/images/final-google-logo.png',
                      width: Get.width / 12,
                      height: Get.height / 12,
                    ),
                    onPressed: () {},
                    label: Text(
                      'Sign in with google',
                      style: TextStyle(color: AppConstant.appTextColor),
                    )),
              ),
            ),
            SizedBox(
              height: Get.height / 50,
            ),
            Material(
              child: Container(
                width: Get.width / 1.2,
                height: Get.height / 12,
                decoration: BoxDecoration(
                    color: AppConstant.appSecondryColor,
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton.icon(
                    icon: Icon(
                      Icons.email,
                      color: AppConstant.appTextColor,
                    ),
                    onPressed: () {},
                    label: Text(
                      'Sign in with email',
                      style: TextStyle(color: AppConstant.appTextColor),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
