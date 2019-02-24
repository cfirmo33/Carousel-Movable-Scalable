import 'package:flutter/material.dart';

import '../../models/product-model.dart';

class ImageProduct extends StatelessWidget {
  final List<ProductModel> products;
  final int index;

  ImageProduct(this.products, this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.all(0.0),
      padding: EdgeInsets.all(0.0),
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(products[index].imageURL),
      )),
    );
  }
}
