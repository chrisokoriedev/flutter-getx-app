import 'package:get/get.dart';
import 'package:get_tutorial/model/products.dart';

class ShoppingController extends GetxController {
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(Duration(seconds: 1));
    var productResult = [
      Product(1, 'Sneakers', 'abd', 'it a nice sneaker', 200),
      Product(2, 'rice', 'abd', 'it a good rice', 50),
      Product(3, 'bead', 'abd', 'it a nice bead', 200),
      Product(4, 'bottle water', 'abd', 'it a nice bottle', 10),
    ];
    products.value = productResult;
  }
}
