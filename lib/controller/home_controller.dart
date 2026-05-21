import 'package:get/get.dart';

import '../model/product_model.dart';
import '../service/api_service.dart';

class HomeController extends GetxController {
  var isLoading = true.obs;

  var productList = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);

      final data = await ApiService.getProducts();

      productList.assignAll(data);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }
}