import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/cart_controller.dart';
import '../controller/login_controller.dart';
import 'login_page.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final loginC = Get.put(LoginController());
  final cartC = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    loginC.getUser();

    return Scaffold(
      backgroundColor: const Color(0xffF3F4EE),

      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 0, 
        backgroundColor: const Color(0xffF3F4EE),
        elevation: 0,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 80),
            Row(
              children: [
                const CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.black54,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 35,
                  ),
                ),

                const SizedBox(width: 15),

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [

                      Obx(
                        () => Text(
                          loginC.email.value,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                      ),

                      const SizedBox(height: 4),

                      Obx(
                        () => Text(
                          "Jumlah Barang di Keranjang: ${cartC.cartList.length}",
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),

            SizedBox(
              width: double.infinity,
              height: 50,

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.redAccent,
                  elevation: 0,
                  shape:
                      RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(30),
                  ),
                ),

                onPressed: () async {
                  await loginC.logout();

                  Get.offAll(
                    () => LoginPage(),
                  );
                },

                child: const Text(
                  "Logout",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}