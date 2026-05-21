import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../model/product_model.dart';

class CartController extends GetxController {
  late Box cartBox;

  var cartList = [].obs;

  @override
  void onInit() {
    cartBox = Hive.box('cartBox');

    getCart();

    super.onInit();
  }

  void getCart() {
    cartList.value = cartBox.values.toList();
  }

  void addCart(ProductModel product) {
    cartBox.put(product.id, {
      'id': product.id,
      'title': product.title,
      'price': product.price,
      'image': product.image,
      'rating': product.rating,
    });

    getCart();

    Get.snackbar('Berhasil', 'Produk masuk keranjang');
  }

  void removeCart(int id) {
    cartBox.delete(id);

    getCart();

    Get.snackbar('Berhasil', 'Produk dihapus');
  }

  bool isInCart(int id) {
    return cartBox.containsKey(id);
  }
}