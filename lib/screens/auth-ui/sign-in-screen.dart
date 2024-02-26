// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../utils/app-constant.dart';
import 'sign-up-screen.dart';

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
          backgroundColor: AppConstant.appSecondaryColor,
          title: Text(
            "Sign In",
            style: TextStyle(
                color: AppConstant.appTextColor, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Container(
          child: Column(
            children: [
              isKeyboardVisible
                  ? SizedBox.shrink()
                  : Column(
                      children: [
                        Lottie.asset("assets/images/splash-icon.json")
                      ],
                    ),
              SizedBox(
                height: Get.height / 12,
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      cursorColor: AppConstant.appSecondaryColor,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: "Email Address",
                          prefixIcon: Icon(Icons.email),
                          contentPadding: EdgeInsets.only(top: 2.0, left: 8.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  )),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      cursorColor: AppConstant.appSecondaryColor,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                          hintText: "Password",
                          prefixIcon: Icon(Icons.key),
                          suffixIcon: Icon(Icons.visibility_off),
                          contentPadding: EdgeInsets.only(top: 2.0, left: 8.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  )),
              SizedBox(
                height: Get.height / 70,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                alignment: Alignment.centerRight,
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                      color: AppConstant.appSecondaryColor,
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
                      color: AppConstant.appSecondaryColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    child: Text(
                      "SIGN IN",
                      style: TextStyle(
                          color: AppConstant.appTextColor, fontSize: 16),
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              SizedBox(
                height: Get.height / 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(
                        color: AppConstant.appSecondaryColor, fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () => Get.offAll(() => SignUpScreen()),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          color: AppConstant.appSecondaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
