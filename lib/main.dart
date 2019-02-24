import 'package:carousel_zoom_transition/products/widgets/custom-builder-animation.dart';
import 'package:flutter/material.dart';
import './products/widgets/logo.dart';
import './models/product-model.dart';
import './products/store.dart';

main() => runApp(MaterialApp(home: Carroussel()));

class Carroussel extends StatefulWidget {
  @override
  _CarrousselState createState() => _CarrousselState();
}

class _CarrousselState extends State<Carroussel> {
  PageController _pageController;
  int _currentpage = 1;
  final List<ProductModel> _products = getProducts();

  @override
  initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _currentpage,
      keepPage: false,
      viewportFraction: 0.55,
    );
  }

  @override
  dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.orange,
      ),

      ////////////////////////////////////////////
      home: Scaffold(
        // backgroundColor: Colors.grey.shade200,
        backgroundColor: Color(0xFFEFF2F9),
        //#--------------Drawer ----------------
        drawer: Drawer(
          child: Center(),
        ),
        //#--------------Appbar ----------------
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: LogoWedget(),
          actions: <Widget>[
            //----- Button Basket
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.add_shopping_cart),
            ),
            //----- Button Search
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
            ),
          ],
        ),

        //#--------------Body ----------------
        body: Stack(
          children: <Widget>[
            ClipPath(
              clipBehavior: Clip.antiAlias,
              clipper: CustomFormBackground(),
              child: Container(
                width: double.infinity,
                height: 400.0,
                color: Colors.white,
              ),
            ),

            /////////////////////////////////////////////
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 18.0,
                  ),
                  Text(
                    "Featured Products",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 21.0,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      // color: Colors.teal,
                      height: double.maxFinite,
                      child: PageView.builder(
                        itemCount: _products.length,
                        onPageChanged: (value) {
                          setState(() {
                            _currentpage = value;
                          });
                        },
                        controller: _pageController,
                        itemBuilder: (context, index) =>
                            // builder(index, products, currentpage)),
                            CustomBuilderAnimation(
                                index: index,
                                products: _products,
                                pageController: _pageController,
                                currentpage: _currentpage),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomFormBackground extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height);
    path.quadraticBezierTo(
        size.width / 5, size.height - 100, size.width / 2, size.height - 100);
    path.lineTo(size.width, size.height - 100);
    path.lineTo(size.width, 0.0);
    // path.quadraticBezierTo(size.width, size.height - 100, size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomFormBackground oldClipper) {
    return true;
  }
}
