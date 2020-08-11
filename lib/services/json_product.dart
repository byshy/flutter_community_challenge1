import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/product.dart';

class JsonServices {

  Future<List<Product>> loadJson() async {
    var data = await http.get("https://run.mocky.io/v3/188d9248-9464-4241-ba24-e2d"
        "a025f373e?fbclid=IwAR0IbVcKbSfdZwMfT"
        "X0s9vjM-BGP0XvnJJzCqtEZzpX7DrKYRgCL5WKDnyg");
    var jasonData = json.decode(data.body);
    List<Product> _products = [];
    for(var p in jasonData){
      Product product = Product(price: p['price'],name: p['name'],id: p['id'],image: p['image']);
      _products.add(product);
    }
    print(_products.length);
    return _products;
  }
}