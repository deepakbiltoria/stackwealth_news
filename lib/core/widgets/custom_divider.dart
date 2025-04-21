import 'package:flutter/material.dart';
import 'package:stackwealth_news/core/utils/color_constant.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30, left: 30, right: 30),
      child: Divider(
        color: ColorConstant.gray200,
        thickness: 2,
      ),
    );
  }
}
