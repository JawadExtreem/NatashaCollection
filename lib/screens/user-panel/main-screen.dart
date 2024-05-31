// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:natasha_collection/screens/auth-ui/welcome-screen.dart';
import 'package:natasha_collection/utils/app-constant.dart';
import 'package:natasha_collection/widgets/custom-drawer-widget.dart';

import '../../widgets/all-products-widget.dart';
import '../../widgets/banner-widget.dart';
import '../../widgets/category-widget.dart';
import '../../widgets/flash-sale-widget.dart';
import '../../widgets/heading-widget.dart';
import 'all-categories-screen.dart';
import 'all-flash-sale-products.dart';
import 'all-product-screen.dart';

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
        iconTheme: IconThemeData(color: AppConstant.appTextColor),
        centerTitle: true,
        backgroundColor: AppConstant.appMainColor,
        title: Text(
          style: TextStyle(color: AppConstant.appTextColor),
          AppConstant.appMainName,
        ),
      ),
      drawer: DrawerWidget(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: Get.height / 90.0,
              ),
              //  Text('MUHAMMAD JAWAD'),
              // banner
              BannerWidget(),
              // heading widget
              HeadingWidget(
                headingTitle: 'Categories',
                headingSubTitle: 'According to your budget',
                onTap: () => Get.to(() => AllCategoriesScreen()),
                buttontext: 'See More >',
              ),

              CategoryWidget(),
              HeadingWidget(
                headingTitle: 'Flash Sale',
                headingSubTitle: 'According to your budget',
                onTap: () => Get.to(() => AllFlashProductsScreen()),
                buttontext: 'See More >',
              ),
              FlashSaleWidget(),

              CategoryWidget(),
              HeadingWidget(
                headingTitle: 'All Products',
                headingSubTitle: 'According to your budget',
                onTap: () => Get.to(() => AllProductScreen()),
                buttontext: 'See More >',
              ),

              AllProductsWidgets()
            ],
          ),
        ),
      ),
    );
  }
}
