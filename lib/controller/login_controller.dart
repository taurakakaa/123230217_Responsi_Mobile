import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  var email = ''.obs;

  Future<void> login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('email', emailC.text);

    await prefs.setBool('isLogin', true);

    email.value = emailC.text;
  }

  Future<void> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    email.value = prefs.getString('email') ?? '';
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.clear();

    email.value = '';
    emailC.clear();
    passC.clear();
  }

  @override
  void onClose() {
    emailC.dispose();
    passC.dispose();
    super.onClose();
  }
}