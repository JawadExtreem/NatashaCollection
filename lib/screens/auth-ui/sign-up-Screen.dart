// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:natasha_collection/screens/auth-ui/sign-in-screen.dart';
import 'package:natasha_collection/utils/app-constant.dart';

import '../../controllers/sign-up-controller.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignUpScreen> {
  final SignUpController signUpController = Get.put(SignUpController());
  TextEditingController username = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPhone = TextEditingController();
  TextEditingController userCity = TextEditingController();
  TextEditingController userPassword = TextEditingController();
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
                        controller: username,
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
                Container(
                    width: Get.width,
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: userPhone,
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
                        controller: userCity,
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
                        child: Obx(
                          () => TextFormField(
                            controller: userPassword,
                            obscureText:
                                signUpController.isPasswordVisible.value,
                            cursorColor: AppConstant.appSecondryColor,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                                hintText: "Passowrd",
                                prefixIcon: Icon(Icons.lock),
                                suffixIcon: GestureDetector(
                                    onTap: () {
                                      signUpController.isPasswordVisible
                                          .toggle();
                                    },
                                    child:
                                        signUpController.isPasswordVisible.value
                                            ? Icon(Icons.visibility_off)
                                            : Icon(Icons.visibility)),
                                contentPadding:
                                    EdgeInsets.only(left: 8, top: 2),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ))),
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
                          String name = username.text.trim();
                          String email = userEmail.text.trim();
                          String phone = userPhone.text.trim();
                          String city = userCity.text.trim();
                          String password = userPassword.text.trim();
                          String userDeviceToken = '';

                          if (name.isEmpty ||
                              email.isEmpty ||
                              phone.isEmpty ||
                              city.isEmpty ||
                              password.isEmpty) {
                            Get.snackbar(
                              'Error',
                              'Please enter all details',
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: AppConstant.appSecondryColor,
                              colorText: AppConstant.appTextColor,
                            );
                          } else {
                            UserCredential? userCredential =
                                await signUpController.signUpMethod(name, email,
                                    phone, city, password, userDeviceToken);

                            if (userCredential != null) {
                              Get.snackbar(
                                'Verification email sent.',
                                'Please check your email.',
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: AppConstant.appSecondryColor,
                                colorText: AppConstant.appTextColor,
                              );
                              FirebaseAuth.instance.signOut();
                              Get.offAll(() => SignInScreen());
                            }
                          }
                        },
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
