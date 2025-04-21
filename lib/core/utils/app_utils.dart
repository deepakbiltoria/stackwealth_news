import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:stackwealth_news/core/utils/color_constant.dart';
import 'package:velocity_x/velocity_x.dart';

void showToastMessage(String title, String message) {
  Get.snackbar(title, message,
      duration: const Duration(seconds: 4),
      backgroundColor: title == "Error" ? Vx.red500 : null,
      colorText: title == "Error" ? Vx.white : null);
}

void showSnackbar(String title) {
  Get.showSnackbar(GetSnackBar(
    message: title,
    isDismissible: true,
    backgroundColor: ColorConstant.amber900,
    duration: Duration(seconds: 4),
  ));
}

Widget buildLoadingIndicator() {
  return const CupertinoActivityIndicator().p(10).box.white.roundedFull.make();
}

BoxDecoration buildContainerdecoration() {
  return BoxDecoration(
      gradient: LinearGradient(colors: [
    ColorConstant.amber90001,
    ColorConstant.orangeA200,
  ]));
}

bool handleSafeArea() => GetPlatform.isAndroid ? true : false;

extension StringExtensions on String {
  int toInt() {
    return int.tryParse(this) ?? 0;
  }

  double toDouble() {
    return double.tryParse(this) ?? 0.0;
  }
}
