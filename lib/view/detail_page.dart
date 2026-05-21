import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cart_page.dart';
import '../controller/cart_controller.dart';
import '../controller/detail_controller.dart';

class DetailPage extends StatefulWidget {
  final int id;

  const DetailPage({
    super.key,
    required this.id,
  });

  @override
  State<DetailPage> createState() =>
      _DetailPageState();
}

class _DetailPageState
    extends State<DetailPage> {
  final detailC =
      Get.put(DetailController());

  final cartC =
      Get.put(CartController());

  @override
  void initState() {
    detailC.getDetail(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xffF3F4EE),

      appBar: AppBar(
        backgroundColor:
            const Color(0xffF3F4EE),

        elevation: 0,

        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),

        title: const Text(
          'Detail',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),

        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => CartPage());
            },
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.black,
            ),
          ),
        ],
      ),

      body: Obx(() {
        if (detailC.isLoading.value) {
          return const Center(
            child:
                CircularProgressIndicator(),
          );
        }

        final product =
            detailC.product!;

        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment
                          .start,
                  children: [
                    Container(
                      height: 320,
                      width:
                          double.infinity,
                      color: Colors.white,

                      child: Padding(
                        padding:
                            const EdgeInsets
                                .all(20),
                        child: Image.network(
                          product.image,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    Padding(
                      padding:
                          const EdgeInsets
                              .all(20),
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment
                                .start,
                        children: [
                          Text(
                            product.title,
                            style:
                                const TextStyle(
                              fontSize: 22,
                              fontWeight:
                                  FontWeight
                                      .bold,
                            ),
                          ),

                          const SizedBox(
                              height: 10),

                          Text(
                            '\$${product.price}',
                            style:
                                const TextStyle(
                              fontSize: 22,
                              fontWeight:
                                  FontWeight
                                      .bold,
                            ),
                          ),

                          const SizedBox(
                              height: 10),

                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors
                                    .orange,
                                size: 18,
                              ),

                              const SizedBox(
                                  width: 5),

                              Text(
                                '${product.rating} (${product.review})',
                                style:
                                    TextStyle(
                                  color: Colors
                                      .grey
                                      .shade700,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(
                              height: 25),

                          const Text(
                            "Deskripsi Produk",
                            style:
                                TextStyle(
                              fontSize: 18,
                              fontWeight:
                                  FontWeight
                                      .bold,
                            ),
                          ),

                          const SizedBox(
                              height: 10),

                          Text(
                            product.description,
                            style:
                                TextStyle(
                              fontSize: 14,
                              color: Colors
                                  .grey
                                  .shade700,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              padding:
                  const EdgeInsets.all(
                15,
              ),

              width: double.infinity,

              color: Colors.white,

              child: SizedBox(
                height: 50,

                child: ElevatedButton(
                  style:
                      ElevatedButton
                          .styleFrom(
                    backgroundColor:
                        cartC.isInCart(
                                product.id)
                            ? Colors.grey
                            : const Color(
                                0xff3D9441),

                    elevation: 0,

                    shape:
                        RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius
                              .circular(
                        30,
                      ),
                    ),
                  ),

                  onPressed: () {
                    if (!cartC.isInCart(
                        product.id)) {
                      cartC.addCart(
                          product);

                      setState(() {});
                    }
                  },

                  child: Text(
                    cartC.isInCart(
                            product.id)
                        ? 'Sudah di Keranjang'
                        : 'Masukkan ke Keranjang',

                    style:
                        const TextStyle(
                      color:
                          Colors.white,
                      fontSize: 16,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}