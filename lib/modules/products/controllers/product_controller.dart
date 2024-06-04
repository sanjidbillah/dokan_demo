import 'package:dokan_demo/core/base/base_controller.dart';
import 'package:dokan_demo/core/models/view_state.dart';
import 'package:dokan_demo/modules/products/data/models/products.dart';
import 'package:dokan_demo/modules/products/data/repository/product_repository.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

import '../data/models/filter_model.dart.dart';

class ProductController extends BaseController {
  final ProductReposity _productReposity;
  ProductController(this._productReposity);
  RxList<Products> products = <Products>[].obs;
  final List<Products> _backupProduct = <Products>[];
  getProducts() {
    try {
      final productParse = _productReposity.getProducts();
      products.value = productParse;
      _backupProduct.addAll(productParse);
      viewState.value = ViewState.loaded;
    } catch (e) {
      setException = e;
    }
  }

  RxList<FilterModel> filters = <FilterModel>[
    FilterModel(name: "Newest", filterState: FilterState.newest),
    FilterModel(
      name: "Oldest",
      filterState: FilterState.oldest,
    ),
    FilterModel(
      name: "Price low > High",
      filterState: FilterState.lowToHigh,
    ),
    FilterModel(
      name: "Price high > Low",
      filterState: FilterState.highToLow,
    ),
    FilterModel(
      name: "Best selling",
      filterState: FilterState.bestSelling,
    ),
  ].obs;
  Rx<FilterState> currentFilter = FilterState.none.obs;
  filterProduct() {
    if (currentFilter.value == FilterState.newest) {
      products.sort((a, b) => a.dateCreated!.compareTo(b.dateCreated!));
    } else if (currentFilter.value == FilterState.oldest) {
      products.sort((a, b) => a.dateCreated!.compareTo(b.dateCreated!));
    } else if (currentFilter.value == FilterState.highToLow) {
      products
          .sort((a, b) => int.parse(b.price!).compareTo(int.parse(a.price!)));
    } else if (currentFilter.value == FilterState.lowToHigh) {
      products
          .sort((a, b) => int.parse(a.price!).compareTo(int.parse(b.price!)));
    } else if (currentFilter.value == FilterState.bestSelling) {
      products.sort((a, b) => b.totalSales!.compareTo(a.totalSales!));
    } else {
      products.value = _backupProduct;
    }
  }

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }
}
