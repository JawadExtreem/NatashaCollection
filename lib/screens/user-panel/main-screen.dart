import 'package:flutter/material.dart';
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
        backgroundColor: AppConstant.appMainColor,
        title: Text(
          style: TextStyle(color: AppConstant.appTextColor),
          AppConstant.appMainName,
        ),
      ),
    );
  }
}
