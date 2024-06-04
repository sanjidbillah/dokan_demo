import 'package:dokan_demo/modules/products/data/models/products.dart';

abstract class ProductLocalDataSource {
  List<Products> getProducts();
}
