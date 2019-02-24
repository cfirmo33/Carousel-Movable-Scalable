import 'package:carousel_zoom_transition/models/product-model.dart';
import 'package:carousel_zoom_transition/products/widgets/image-product.dart';
import 'package:flutter/material.dart';

class CustomBuilderAnimation extends StatelessWidget {
  final int index;
  final List<ProductModel> products;
  final PageController pageController;
  final int currentpage;
  CustomBuilderAnimation(
      {this.index, this.products, this.currentpage, this.pageController});

  //-----------------------------------------------------
  @override
  Widget build(BuildContext context) {
    double _width;
    //#!!!!!!!!!!!!! Builder !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    return AnimatedBuilder(
      animation: pageController,
      child: ImageProduct(products, index),
      builder: (context, child) {
        return _buildInfoProduct(context, child, index, _width);
      },
    );
  }

  // Build product info Bloc .................
  Widget _buildInfoProduct(
      BuildContext context, Widget child, int index, double _width) {
    double value = 1.0;
    if (pageController.position.haveDimensions) {
      value = pageController.page - index;
      value = (1 - (value.abs() * 0.45)).clamp(0.0, 1.0);
    }
    index == currentpage ? _width = 450 : _width = 250;

    return Center(
      child: Container(
        child: SizedBox(
          width: Curves.easeOut.transform(value) * _width,
          height: Curves.easeOut.transform(value) * _width * 1.1,
          child: index == currentpage
              ? Material(
                  // elevation: 8.0,
                  color: Colors.transparent,
                  child: Column(
                    children: <Widget>[
                      Expanded(child: child),
                      //--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^-----
                      Container(
                        width: 400,
                        alignment: Alignment.bottomCenter,
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          '${products[index].name}',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 21.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      //--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^-----
                      Container(
                        width: 400,
                        alignment: Alignment.bottomCenter,
                        padding: EdgeInsets.only(bottom: 15.0),
                        child: Text(
                          '\$${products[index].price.toString()}',
                          style: TextStyle(
                              color: Colors.orange,
                              fontSize: 32.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      //--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^-----
                      RawMaterialButton(
                        onPressed: () {},
                        constraints:
                            BoxConstraints(minWidth: 50.0, minHeight: 50.0),
                        fillColor: Colors.orange,
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 30.0,
                        ),
                        clipBehavior: Clip.antiAlias,
                        shape: CircleBorder(),
                      ),
                      SizedBox(
                        height: 20.0,
                      )

                      //--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^-----
                    ],
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                )
              : Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: Container(
                    //color: Colors.grey[200],
                    child: child,
                  ),
                ),
        ),
      ),
    );
  }
}
