import '../models/product-model.dart';

List<ProductModel> getProducts() {
  return [
    ProductModel(
      name: 'Chair 01',
      price: 250,
      imageURL: 'assets/01.png',
    ),
    ProductModel(
      name: 'Chair 02',
      price: 150,
      imageURL: 'assets/02.png',
    ),
    ProductModel(
      name: 'Chair 03',
      price: 233,
      imageURL: 'assets/03.png',
    ),
    ProductModel(
      name: 'Chair 04',
      price: 180,
      imageURL: 'assets/04.png',
    ),
    ProductModel(
      name: 'Chair 05',
      price: 210,
      imageURL: 'assets/05.png',
    ),
    ProductModel(
      name: 'Chair 06',
      price: 275,
      imageURL: 'assets/06.png',
    ),
  ];
}
