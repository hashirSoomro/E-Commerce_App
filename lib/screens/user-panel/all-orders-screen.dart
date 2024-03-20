// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comm/controllers/cart-price-controller.dart';
import 'package:e_comm/models/order-model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:get/get.dart';

import '../../models/cart-model.dart';
import '../../utils/app-constant.dart';
import 'checkout-screen.dart';

class AllOrdersScreen extends StatefulWidget {
  const AllOrdersScreen({super.key});

  @override
  State<AllOrdersScreen> createState() => _AllOrdersScreenState();
}

class _AllOrdersScreenState extends State<AllOrdersScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  final ProductPriceController productPriceController =
      Get.put(ProductPriceController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppConstant.appTextColor),
        backgroundColor: AppConstant.appMainColor,
        title: Text(
          "All Orders",
          style: TextStyle(color: AppConstant.appTextColor),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('orders')
            .doc(user!.uid)
            .collection('confirmOrders')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Error"),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              height: Get.height / 5,
              child: Center(
                child: CupertinoActivityIndicator(),
              ),
            );
          }
          if (snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text("No Products Found!"),
            );
          }
          if (snapshot.data != null) {
            return Container(
              child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final productData = snapshot.data!.docs[index];
                    OrderModel orderModel = OrderModel(
                      productId: productData['productId'],
                      categoryId: productData['categoryId'],
                      productName: productData['productName'],
                      categoryName: productData['categoryName'],
                      salePrice: productData['salePrice'],
                      fullPrice: productData['fullPrice'],
                      productImages: productData['productImages'],
                      deliveryTime: productData['deliveryTime'],
                      isSale: productData['isSale'],
                      productDescription: productData['productDescription'],
                      createdAt: productData['createdAt'],
                      updatedAt: productData['updatedAt'],
                      productQuantity: productData['productQuantity'],
                      productTotalPrice: productData['productTotalPrice'],
                      customerId: productData['customerId'],
                      status: productData['status'],
                      customerName: productData['customerName'],
                      customerPhone: productData['customerPhone'],
                      customerAddress: productData['customerAddress'],
                      customerDeviceToken: productData['customerDeviceToken'],
                    );

                    //Calculate Price
                    productPriceController.fetchProductPrice();

                    return Card(
                      elevation: 5,
                      color: AppConstant.appTextColor,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: AppConstant.appMainColor,
                          backgroundImage:
                              NetworkImage(orderModel.productImages[0]),
                        ),
                        title: Text(orderModel.productName),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(orderModel.productTotalPrice.toString()),
                            SizedBox(
                              width: 10,
                            ),
                            orderModel.status != true
                                ? Text(
                                    "Pending...",
                                    style: TextStyle(color: Colors.red),
                                  )
                                : Text(
                                    "Delivered",
                                    style: TextStyle(color: Colors.green),
                                  )
                          ],
                        ),
                      ),
                    );
                  }),
            );
          }
          return Container();
        },
      ),
    );
  }
}
