
import 'package:flutter/material.dart';

class Product {
  Product({
    this.productId,
    this.title,
  });

  String? productId;
  String? title;

  factory Product.fromJson(Map<String, dynamic> json){
    return Product(
      productId: json["data"]["result"]["productId"].toString(),
      title: json["data"]["result"]["title"],
    );
  }
}

class ProductService {
  Future<List<Product>> getProductName(String searchKeyword) async {
    // 서버에서 productname을 받아오는 코드

    List<Product> products = [];

    // 받아온 것을 products에 담는 코드

    return products;
  }


}