import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProgressDialogUtils {
  static bool isProgressVisible = false;

  ///common method for showing progress dialog
  static void showProgressDialog({bool isCancellable = false}) async {
    if (Get.isDialogOpen == true) {
      return;
    }
    if (Get.isSnackbarOpen == true) {
      return;
    }
    Get.dialog(
      Center(
        child: CircularProgressIndicator.adaptive(
          strokeWidth: 4,
          valueColor: AlwaysStoppedAnimation<Color>(
            Colors.white,
          ),
        ),
      ),
      barrierDismissible: isCancellable,
    );
  }

  ///common method for hiding progress dialog
  static void hideProgressDialog() {
    if (Get.isDialogOpen == true) {
      Get.back();
    }
    if (Get.isSnackbarOpen == true) {
      Get.back();
    }
    if (Get.isDialogOpen == true) {
      Get.back();
    }
  }
}
