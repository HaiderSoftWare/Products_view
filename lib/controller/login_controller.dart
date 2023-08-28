import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:products_view/view/screen/home.screen.dart';

class LoginController extends GetxController {
  final userNameControler = TextEditingController();
  final passwordControler = TextEditingController();
  String adminUser = 'admin';
  String adminPassword = '12345678';

  checkUser() {
    // When Username of Password incorrect
    if (userNameControler.text != adminUser ||
        passwordControler.text != adminPassword) {
      return Get.snackbar(
        'Error',
        'The data entered is incorrect',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    // When Username of Password correct
    else {
      return Get.to(HomeScreen());
    }
  }
}
