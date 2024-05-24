// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:natasha_collection/controllers/sign-in-controller.dart';
import 'package:natasha_collection/screens/auth-ui/sign-up-Screen.dart';
import 'package:natasha_collection/screens/user-panel/main-screen.dart';
import 'package:natasha_collection/utils/app-constant.dart';

import '../../controllers/forget-passowrd-controller.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final ForgetPasswordController forgetPasswordController =
      Get.put(ForgetPasswordController());
  TextEditingController userEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppConstant.appSecondryColor,
          title: Text(
            'Forget Passowrd',
            style: TextStyle(color: AppConstant.appTextColor),
          ),
        ),
        body: Container(
          child: Column(
            children: [
              isKeyboardVisible
                  ? SizedBox.shrink()
                  : Column(
                      children: [
                        Lottie.asset('assets/images/splash-icon.json')
                      ],
                    ),
              SizedBox(
                height: Get.height / 20,
              ),
              Container(
                  width: Get.width,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: userEmail,
                      cursorColor: AppConstant.appSecondryColor,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: "Email",
                          prefixIcon: Icon(Icons.email),
                          contentPadding: EdgeInsets.only(left: 8, top: 2),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  )),
              SizedBox(
                height: Get.height / 20,
              ),
              Material(
                child: Container(
                  width: Get.width / 2,
                  height: Get.height / 18,
                  decoration: BoxDecoration(
                      color: AppConstant.appSecondryColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                      onPressed: () async {
                        String email = userEmail.text.trim();

                        if (email.isEmpty) {
                          Get.snackbar(
                            'Error',
                            "Please enter all details",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: AppConstant.appSecondryColor,
                            colorText: AppConstant.appTextColor,
                          );
                        } else {
                          String email = userEmail.text.trim();
                          forgetPasswordController.ForgetPassowrdMethod(email);
                        }
                      },
                      child: Text(
                        'Forget',
                        style: TextStyle(color: AppConstant.appTextColor),
                      )),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
