import 'package:dokan_demo/modules/products/data/data_source/product_local_data_source.dart';
import 'package:dokan_demo/modules/products/data/models/products.dart';

import 'product_repository.dart';

class ProductReposityImpl implements ProductReposity {
  final ProductLocalDataSource _productLocalDataSource;
  ProductReposityImpl(this._productLocalDataSource);

  @override
  List<Products> getProducts() {
    return _productLocalDataSource.getProducts();
  }
}
