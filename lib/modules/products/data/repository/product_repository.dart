import '../models/products.dart';

abstract class ProductReposity {
  List<Products> getProducts();
}
