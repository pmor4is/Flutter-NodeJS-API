import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Api {
  static const baseUrl = "";

  static addProduct (Map productData) async {
    try {
      final res = await http.post(Uri.parse(uri), productData);
      if (res.statusCode == 200) {
        //
      } else {
        //
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}