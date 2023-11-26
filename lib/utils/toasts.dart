import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Toasts {
  static void showErrorToast(String heading, String description) {
    Get.snackbar(
      heading,
      description,
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.w),
      backgroundColor: Colors.white,
      colorText: Colors.red,
      icon: const Icon(
        Icons.error_outline,
        color: Colors.red,
      ),
    );
  }
}
