import 'package:get/get.dart';

import '../model/product_model.dart';
import '../service/api_service.dart';

class DetailController extends GetxController {
  var isLoading = true.obs;

  ProductModel? product;

  void getDetail(int id) async {
    try {
      isLoading(true);

      final data = await ApiService.getDetail(id);

      product = data;

      update();
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }
}