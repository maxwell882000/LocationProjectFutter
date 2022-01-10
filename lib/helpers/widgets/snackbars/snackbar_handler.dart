import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarHandler {
  static void error({required String title, required String body}) {
    Get.snackbar(title.tr, body.tr,
        colorText: Colors.white ,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red);
  }
    static void success({required String title, required String body}) {
    Get.snackbar(title.tr, body.tr,
        colorText: Colors.white ,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green);
  }
}
