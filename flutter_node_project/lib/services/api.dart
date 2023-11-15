import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_node_project/models/product_model.dart';
import 'package:http/http.dart' as http;


class Api {
  static const baseUrl = "http://192.168.0.117/api/";

  // Create method
  static addProduct (Map productData) async {
    print(productData);
    var url = Uri.parse("${baseUrl}add_product");
    try {
      final res = await http.post(url, body: productData);
      if (res.statusCode == 200) {
        // Se a requisição der certo
        var data = jsonDecode(res.body.toString());
        print(data);
      } else {
        // Se der errado
        print("Failed to get response");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // Get method
  static getProduct() async {

    List<Product> products = [];

    var url = Uri.parse("${baseUrl}get_product");
    try {
      final res = await http.get(url);
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        data['products'].forEach(
          (value) => {
            products.add(Product(
              id: value['id'].toString(),
              name: value['productName'],
              description: value['productDescription'],
              price: value['productPrice'],
            ),)
          },
        );
        print(data);
        return products;
      } else {
        print("Failed to get response");
        return [];
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // Update put method
  static updateProduct(id, body) async {
    var url = Uri.parse(baseUrl + "update/$id");

    final res = await http.put(url, body: body);
    if(res.statusCode == 200) {
      print(jsonDecode(res.body));
    } else {
      print("Failed to update data");
    }
  }

  // Delete method
  static deleteProduct(id) async {
    var url = Uri.parse("${baseUrl}delete/$id");
    try {
      final res = await http.post(url);
      if(res.statusCode == 204) {
        print(jsonDecode(res.body));
      } else {
        print("Failed to delete data");
      }

    } catch (e) {
      debugPrint(e.toString());
    }


  }
}