// ignore_for_file: must_be_immutable, prefer_const_constructors, avoid_unnecessary_containers, prefer_interpolation_to_compose_strings

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../models/product-model.dart';
import '../../utils/app-constant.dart';

class ProductDetailsScreen extends StatefulWidget {
  ProductModel productModel;
  ProductDetailsScreen({super.key, required this.productModel});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppConstant.appTextColor),
        backgroundColor: AppConstant.appMainColor,
        title: Text(
          "Product Details",
          style: TextStyle(color: AppConstant.appTextColor),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            //products images
            SizedBox(
              height: Get.height / 60,
            ),
            CarouselSlider(
              items: widget.productModel.productImages
                  .map(
                    (imageUrls) => ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl: imageUrls,
                        fit: BoxFit.cover,
                        width: Get.width - 10,
                        placeholder: (context, url) => ColoredBox(
                          color: Colors.white,
                          child: Center(
                            child: CupertinoActivityIndicator(),
                          ),
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                scrollDirection: Axis.horizontal,
                autoPlay: true,
                aspectRatio: 2.5,
                viewportFraction: 1,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.productModel.productName,
                            ),
                            Icon(Icons.favorite_outline)
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "PKR: " + widget.productModel.fullPrice,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Category: " + widget.productModel.categoryName,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          widget.productModel.productDescription,
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Material(
                              child: Container(
                                width: Get.width / 3.0,
                                height: Get.height / 16,
                                decoration: BoxDecoration(
                                    color: AppConstant.appSecondaryColor,
                                    borderRadius: BorderRadius.circular(20)),
                                child: TextButton(
                                  child: Text(
                                    "Add to Cart",
                                    style: TextStyle(
                                        color: AppConstant.appTextColor,
                                        fontSize: 16),
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Material(
                              child: Container(
                                width: Get.width / 3.0,
                                height: Get.height / 16,
                                decoration: BoxDecoration(
                                    color: AppConstant.appSecondaryColor,
                                    borderRadius: BorderRadius.circular(20)),
                                child: TextButton(
                                  child: Text(
                                    "WhatsApp",
                                    style: TextStyle(
                                        color: AppConstant.appTextColor,
                                        fontSize: 16),
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
