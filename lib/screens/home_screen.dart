import 'package:flutter/material.dart';
import 'package:flutter_community_challenge1/screens/cart_screen.dart';

import '../models/product.dart';
import '../services/json_product.dart';
import 'product_info.dart';

class HomeScreen extends StatelessWidget {
  static const route = 'homeScreen';
  @override
  Widget build(BuildContext context) {
    // List<Product> _products = Provider.of<Products>(context).cartProducts;
    // ModalHud mh =  Provider.of<ModalHud>(context);
    JsonServices _js = JsonServices();
    return Scaffold(
      appBar: AppBar(
        title: Text('Products', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, CartScreen.route);
            },
            icon: Icon(Icons.shopping_cart),
            color: Colors.black,
          )
        ],
      ),
      body:
//        ModalProgressHUD(
//          inAsyncCall: mh.isLoading,
//          child:
          Padding(
              padding: EdgeInsets.all(20),
              child: FutureBuilder<ProductsList>(
                  future: _js.loadJson(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      //mh.changeIsLoading(false);
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          return item(
                              snapshot.data.products[index], index, context);
                        },
                        itemCount: snapshot.data.products.length,
                      );
                    } else {
                      //  mh.changeIsLoading(true);
                      return Center(child: Text('Loading.......'));
                    }
                  })),
      //   )
    );
  }

  Widget item(Product product, index, context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, ProductInfoScreen.route,
              arguments: product);
        },
        child: Row(children: <Widget>[
          Placeholder(
            fallbackHeight: 70,
            fallbackWidth: 70,
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            children: <Widget>[
              Text('USD ${product.price}'),
              SizedBox(
                height: 20,
              ),
              Opacity(opacity: 0.6, child: Text('product# ${index}'))
            ],
          )
        ]),
      ),
    );
  }
}
