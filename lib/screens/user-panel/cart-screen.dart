// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app-constant.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppConstant.appTextColor),
        backgroundColor: AppConstant.appMainColor,
        title: Text(
          "Cart",
          style: TextStyle(color: AppConstant.appTextColor),
        ),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Card(
                elevation: 5,
                color: AppConstant.appTextColor,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: AppConstant.appMainColor,
                    child: Text("N"),
                  ),
                  title: Text(""),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("2200"),
                      SizedBox(
                        width: Get.width / 20,
                      ),
                      CircleAvatar(
                        radius: 14,
                        backgroundColor: AppConstant.appMainColor,
                        child: Text('-'),
                      ),
                      SizedBox(
                        width: Get.width / 20,
                      ),
                      CircleAvatar(
                        radius: 14,
                        backgroundColor: AppConstant.appMainColor,
                        child: Text('+'),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(
          bottom: 5,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Total: "),
            Text("PKR: 1200"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                child: Container(
                  width: Get.width / 3.0,
                  height: Get.height / 18,
                  decoration: BoxDecoration(
                      color: AppConstant.appSecondaryColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    child: Text(
                      "Checkout",
                      style: TextStyle(
                          color: AppConstant.appTextColor, fontSize: 18),
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
