import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/cart_controller.dart';
import 'detail_page.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});

  final cartC = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keranjang'),
      ),
      body: Obx(() {
        if (cartC.cartList.isEmpty) {
          return const Center(
            child: Text('Keranjang kosong'),
          );
        }

        return ListView.builder(
          itemCount: cartC.cartList.length,
          itemBuilder: (context, index) {
            final item = cartC.cartList[index];

            return ListTile(
              onTap: () {
                Get.to(() => DetailPage(id: item['id']));
              },
              leading: Image.network(
                item['image'],
                width: 50,
              ),
              title: Text(
                item['title'],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text('\$${item['price']}'),
                  Text('Rating : ${item['rating']}')
                ],
              ),
              trailing: IconButton(
                onPressed: () {
                  cartC.removeCart(item['id']);
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            );
          },
        );
      }),
    );
  }
}