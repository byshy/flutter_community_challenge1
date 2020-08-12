import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/product.dart';

class JsonServices {
  Future<ProductsList> loadJson() async {
    var data = await http.get(
        "https://run.mocky.io/v3/188d9248-9464-4241-ba24-e2da025f373e?fbclid=IwAR0IbVcKbSfdZwMfTX0s9vjM-BGP0XvnJJzCqtEZzpX7DrKYRgCL5WKDnyg");
    var jsonData = json.decode(data.body);
    ProductsList products = ProductsList.fromJson(jsonData['products']);
    return products;
  }
}
