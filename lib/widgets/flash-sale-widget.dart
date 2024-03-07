// ignore_for_file: file_names, avoid_unnecessary_containers, prefer_const_constructors, sized_box_for_whitespace, unnecessary_string_interpolations

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comm/models/product-model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_card/image_card.dart';

import '../models/categories-model.dart';

class FlashSaleWidget extends StatelessWidget {
  const FlashSaleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance
          .collection('products')
          .where('isSale', isEqualTo: true)
          .get(),
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
            height: Get.height / 4.5,
            child: ListView.builder(
              itemCount: snapshot.data!.docs.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final productData = snapshot.data!.docs[index];
                ProductModel productModel = ProductModel(
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
                );
                return Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Container(
                        child: FillImageCard(
                          borderRadius: 20,
                          width: Get.width / 3.5,
                          heightImage: Get.height / 12,
                          imageProvider: CachedNetworkImageProvider(
                            productModel.productImages[0],
                          ),
                          title: Center(
                            child: Text(
                              productModel.productName,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          footer: Row(
                            children: [
                              Text(
                                "Rs${productModel.salePrice}",
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                              SizedBox(
                                width: 2.0,
                              ),
                              Text(
                                "${productModel.fullPrice}",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey.shade600,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          );
        }
        return Container();
      },
    );
  }
}
