import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:natasha_collection/screens/auth-ui/welcome-screen.dart';
import 'package:natasha_collection/utils/app-constant.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () async {
              GoogleSignIn googleSignIn = GoogleSignIn();
              await googleSignIn.signOut();

              Get.offAll(() => WelcomeScreen());
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(
                Icons.logout_sharp,
                color: Colors.white,
              ),
            ),
          )
        ],
        backgroundColor: AppConstant.appMainColor,
        title: Text(
          style: TextStyle(color: AppConstant.appTextColor),
          AppConstant.appMainName,
        ),
      ),
    );
  }
}
