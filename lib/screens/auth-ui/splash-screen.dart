// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../utils/app-constant.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstant.appSecondaryColor,
      appBar: AppBar(
        backgroundColor: AppConstant.appSecondaryColor,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              child: Lottie.asset("assets/images/"),
            )
          ],
        ),
      ),
    );
  }
}
