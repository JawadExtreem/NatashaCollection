// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:natasha_collection/screens/auth-ui/sign-up-Screen.dart';
import 'package:natasha_collection/utils/app-constant.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppConstant.appSecondryColor,
          title: Text(
            'Sign In',
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
              Container(
                  width: Get.width,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      cursorColor: AppConstant.appSecondryColor,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                          hintText: "Passowrd",
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: Icon(Icons.visibility),
                          contentPadding: EdgeInsets.only(left: 8, top: 2),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  )),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.centerRight,
                child: Text(
                  'Forgot Passowrd?',
                  style: TextStyle(
                      color: AppConstant.appSecondryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
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
                      onPressed: () {},
                      child: Text(
                        'SIGN IN',
                        style: TextStyle(color: AppConstant.appTextColor),
                      )),
                ),
              ),
              SizedBox(
                height: Get.height / 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Dont't have an account?  ",
                    style: TextStyle(color: AppConstant.appSecondryColor),
                  ),
                  GestureDetector(
                    onTap: () => Get.offAll(() => SignUpScreen()),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          color: AppConstant.appSecondryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
