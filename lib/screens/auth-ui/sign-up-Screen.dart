// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:natasha_collection/screens/auth-ui/sign-in-screen.dart';
import 'package:natasha_collection/utils/app-constant.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppConstant.appSecondryColor,
          title: Text(
            'Sign Up',
            style: TextStyle(color: AppConstant.appTextColor),
          ),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: Get.height / 20,
                ),
                Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Welcome to my app',
                      style: TextStyle(
                          color: AppConstant.appSecondryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )),
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
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            hintText: "Name",
                            prefixIcon: Icon(Icons.person),
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
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            hintText: "Phone",
                            prefixIcon: Icon(Icons.phone),
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
                        keyboardType: TextInputType.streetAddress,
                        decoration: InputDecoration(
                            hintText: "City",
                            prefixIcon: Icon(Icons.location_pin),
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
                          'SIGN Up',
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
                      "Already have an account?  ",
                      style: TextStyle(color: AppConstant.appSecondryColor),
                    ),
                    GestureDetector(
                      onTap: () => Get.offAll(() => SignInScreen()),
                      child: Text(
                        'Sign In',
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
        ),
      );
    });
  }
}
