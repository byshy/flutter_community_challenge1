class ProductsList {
  final List<Product> products;

  ProductsList({this.products});

  factory ProductsList.fromJson(List<dynamic> json) {
    List<Product> products = json.map((i) => Product.fromJson(i)).toList();
    return ProductsList(products: products);
  }
}

class Product {
  int id;
  String name;
  String price;
  String image;

  Product({this.id, this.name, this.price, this.image});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['image'] = this.image;
    return data;
  }
}
