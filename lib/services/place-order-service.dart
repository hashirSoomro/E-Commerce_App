// ignore_for_file: unused_local_variable

import 'dart:html';
import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comm/services/generate-order-id-service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void placeOrder(
    {required BuildContext context,
    required String customerDeviceToken,
    required String customerAddress,
    required String customerPhone,
    required String customerName}) async {
  final user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('cart')
          .doc(user.uid)
          .collection('cartOrders')
          .get();
      List<QueryDocumentSnapshot> documents = querySnapshot.docs;

      for (var doc in documents) {
        Map<String, dynamic>? data = doc.data() as Map<String, dynamic>;

        String orderId = generateOrderId();
      }
    } catch (e) {
      print('error $e');
    }
  }
}
