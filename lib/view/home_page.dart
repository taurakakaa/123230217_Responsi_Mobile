import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/cart_controller.dart';
import '../controller/home_controller.dart';
import 'cart_page.dart';
import 'detail_page.dart';
import 'profil_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() =>
      _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeC = Get.put(HomeController());
  final cartC = Get.put(CartController());

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List pages = [
      homeContent(),
      ProfilePage(),
    ];

    return Scaffold(
      backgroundColor:
          const Color(0xffF3F4EE),

      appBar: AppBar(
        backgroundColor:
            const Color(0xffF3F4EE),
        elevation: 0,

        title: const Text(
          'Shopedia',
          style: TextStyle(
            color: Color(0xff3D9441),
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

      body: pages[currentIndex],

      bottomNavigationBar:
          BottomNavigationBar(
        currentIndex: currentIndex,

        selectedItemColor:
            const Color(0xff3D9441),

        backgroundColor: Colors.white,

        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }

  Widget homeContent() {
    return Obx(() {
      if (homeC.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      return GridView.builder(
        padding: const EdgeInsets.all(12),

        itemCount:
            homeC.productList.length,

        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.65,
        ),

        itemBuilder: (context, index) {
          final product =
              homeC.productList[index];

          return GestureDetector(
            onTap: () {
              Get.to(
                () => DetailPage(
                  id: product.id,
                ),
              );
            },

            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(
                  15,
                ),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black
                        .withOpacity(0.05),
                    blurRadius: 5,
                    offset:
                        const Offset(0, 2),
                  ),
                ],
              ),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.only(
                        topLeft:
                            Radius.circular(
                                15),
                        topRight:
                            Radius.circular(
                                15),
                      ),
                      child: Container(
                        width:
                            double.infinity,
                        color: Colors.white,
                        child: Padding(
                          padding:
                              const EdgeInsets
                                  .all(10),
                          child: Image.network(
                            product.image,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding:
                        const EdgeInsets.all(
                            10),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment
                              .start,
                      children: [
                        Text(
                          product.title,
                          maxLines: 2,
                          overflow:
                              TextOverflow
                                  .ellipsis,
                          style:
                              const TextStyle(
                            fontSize: 12,
                            fontWeight:
                                FontWeight
                                    .w500,
                          ),
                        ),

                        const SizedBox(
                            height: 6),

                        Text(
                          '\$${product.price}',
                          style:
                              const TextStyle(
                            fontWeight:
                                FontWeight
                                    .bold,
                            fontSize: 16,
                          ),
                        ),

                        const SizedBox(
                            height: 4),

                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color:
                                  Colors.orange,
                              size: 16,
                            ),

                            const SizedBox(
                                width: 3),

                            Text(
                              product.rating
                                  .toString(),
                              style:
                                  const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
  }
}