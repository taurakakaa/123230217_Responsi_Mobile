import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/login_controller.dart';
import 'home_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final loginC = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEEF0E8),

      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.shopping_bag,
                size: 70,
                color: Color(0xff3D9441),
              ),

              const SizedBox(height: 10),

              const Text(
                "Shopedia",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff3D9441),
                ),
              ),

              const SizedBox(height: 40),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Masuk",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: loginC.emailC,
                decoration: InputDecoration(
                  hintText: "Email",
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: Colors.grey,
                  ),

                  filled: true,
                  fillColor:
                      const Color(0xffEEF0E8),

                  contentPadding:
                      const EdgeInsets.symmetric(
                    vertical: 18,
                  ),

                  enabledBorder:
                      OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color:
                          Colors.grey.shade400,
                    ),
                  ),

                  focusedBorder:
                      OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: Color(0xff3D9441),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: loginC.passC,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    color: Colors.grey,
                  ),

                  filled: true,
                  fillColor:
                      const Color(0xffEEF0E8),

                  contentPadding:
                      const EdgeInsets.symmetric(
                    vertical: 18,
                  ),

                  enabledBorder:
                      OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color:
                          Colors.grey.shade400,
                    ),
                  ),

                  focusedBorder:
                      OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: Color(0xff3D9441),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // BUTTON LOGIN
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(0xff3D9441),
                    elevation: 0,
                    shape:
                        RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(
                        30,
                      ),
                    ),
                  ),
                  onPressed: () async {
                    if (loginC
                            .emailC.text
                            .isEmpty ||
                        loginC
                            .passC.text
                            .isEmpty) {
                      Get.snackbar(
                        "Error",
                        "Email dan Password wajib diisi",
                        backgroundColor:
                            Colors.red,
                        colorText:
                            Colors.white,
                      );
                      return;
                    }

                    await loginC.login();

                    Get.offAll(
                      () => const HomePage(),
                    );
                  },
                  child: const Text(
                    "Login",
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
      ),
    );
  }
}