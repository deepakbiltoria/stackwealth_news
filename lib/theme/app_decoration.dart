import 'package:flutter/material.dart';
import 'package:stackwealth_news/core/utils/color_constant.dart';
import 'package:stackwealth_news/core/utils/size_utils.dart';

class AppDecoration {
  static BoxDecoration get outlineBluegray100 => BoxDecoration(
        color: ColorConstant.whiteA700,
        border: Border.all(
          color: ColorConstant.slateGray100,
          width: getHorizontalSize(
            1.00,
          ),
        ),
      );
  static BoxDecoration get txtFillAmber90003 => BoxDecoration(
        color: ColorConstant.gray90003,
      );
  static BoxDecoration get fillBlue => BoxDecoration(
        color: ColorConstant.indigoA200,
        borderRadius: BorderRadius.circular(12),
      );
  static BoxDecoration get fillGreen500 => BoxDecoration(
        color: ColorConstant.slate500,
      );
  static BoxDecoration get outlineGray30001 => BoxDecoration(
        color: ColorConstant.whiteA700,
        border: Border.all(
          color: ColorConstant.gray30001,
          width: getHorizontalSize(
            1.00,
          ),
        ),
      );
  static BoxDecoration get outlineBluegray400 => BoxDecoration(
        color: ColorConstant.whiteA700,
        border: Border.all(
          color: ColorConstant.blueGray400,
          width: getHorizontalSize(
            1.00,
          ),
        ),
      );
  static BoxDecoration get outlineLightgreenA7003f => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(
            0,
            -0.07,
          ),
          end: Alignment(
            1,
            1.18,
          ),
          colors: [
            ColorConstant.amber90001,
            ColorConstant.orangeA200,
          ],
        ),
      );
  static BoxDecoration get gradientOrange70051OrangeA20051 => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(
            0,
            0,
          ),
          end: Alignment(
            1,
            1,
          ),
          colors: [
            ColorConstant.orange70051,
            ColorConstant.orangeA20051,
          ],
        ),
      );
  static BoxDecoration get fillWhiteA700 => BoxDecoration(
        color: ColorConstant.whiteA700,
      );
  static BoxDecoration get gradientOrange700OrangeA20001 => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(
            0,
            0,
          ),
          end: Alignment(
            1,
            1,
          ),
          colors: [
            ColorConstant.orange700,
            ColorConstant.orangeA20001,
          ],
        ),
      );

  static BoxDecoration get gradientWhite700OrangeA20001 => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(
            0,
            0,
          ),
          end: Alignment(
            1,
            1,
          ),
          colors: [
            ColorConstant.whiteA700,
            ColorConstant.gray100,
          ],
        ),
      );

  static BoxDecoration get gradientOrangeLight700OrangeA20001 => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(
            0,
            0,
          ),
          end: Alignment(
            1,
            1,
          ),
          colors: [
            ColorConstant.orangeLightA20001,
            ColorConstant.orangeLight700,
          ],
        ),
      );

  static BoxDecoration get fillOrange50 => BoxDecoration(
        color: ColorConstant.orange50,
      );
  static BoxDecoration get txtFillWhiteA700 => BoxDecoration(
        color: ColorConstant.whiteA700,
      );
  static BoxDecoration get txtFillOrangeA700 => BoxDecoration(
        color: ColorConstant.orange700,
      );
  static BoxDecoration get outlineAmber90003 => BoxDecoration(
        color: ColorConstant.deepOrange50,
      );
  static BoxDecoration get outlineGray100 => BoxDecoration(
        color: ColorConstant.gray100,
        border: Border.all(
          color: ColorConstant.gray100,
          width: getHorizontalSize(
            1.00,
          ),
        ),
      );

  static BoxDecoration get fillOrange100 => BoxDecoration(
        color: ColorConstant.orange100,
      );
  static BoxDecoration get fillAmber90002 => BoxDecoration(
        color: ColorConstant.amber90002,
      );
  static BoxDecoration get outlineBlack9003f => BoxDecoration(
        color: ColorConstant.whiteA700,
        boxShadow: [
          BoxShadow(
            color: ColorConstant.black9003f,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              4,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBlack9003f1 => BoxDecoration(
        color: ColorConstant.whiteA700,
        boxShadow: [
          BoxShadow(
            color: ColorConstant.black9003f,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              4,
            ),
          ),
        ],
      );
  static BoxDecoration get txtFillGray100 => BoxDecoration(
        color: ColorConstant.gray100,
      );
  static BoxDecoration get outlineBlack9003f2 => BoxDecoration(
        color: ColorConstant.amber90003,
        boxShadow: [
          BoxShadow(
            color: ColorConstant.black9003f,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              4,
            ),
          ),
        ],
      );
  static BoxDecoration get fillGray200 => BoxDecoration(
        color: ColorConstant.gray200,
      );
  static BoxDecoration get fillGray100 => BoxDecoration(
        color: ColorConstant.gray100,
      );
  static BoxDecoration get fillGray5001 => BoxDecoration(
        color: ColorConstant.gray5001,
      );
  static BoxDecoration get fillAmber90003 => BoxDecoration(
        color: ColorConstant.amber90003,
      );
}

class BorderRadiusStyle {
  static BorderRadius txtCircleBorder17 = BorderRadius.circular(
    getHorizontalSize(
      17.00,
    ),
  );

  static BorderRadius customBorderTL32 = BorderRadius.only(
    topLeft: Radius.circular(
      getHorizontalSize(
        32.00,
      ),
    ),
    topRight: Radius.circular(
      getHorizontalSize(
        32.00,
      ),
    ),
  );

  static BorderRadius circleBorder19 = BorderRadius.circular(
    getHorizontalSize(
      19.00,
    ),
  );

  static BorderRadius customBorderTL5 = BorderRadius.only(
    topLeft: Radius.circular(
      getHorizontalSize(
        5.00,
      ),
    ),
    topRight: Radius.circular(
      getHorizontalSize(
        5.00,
      ),
    ),
  );

  static BorderRadius circleBorder111 = BorderRadius.circular(
    getHorizontalSize(
      111.00,
    ),
  );

  static BorderRadius circleBorder28 = BorderRadius.circular(
    getHorizontalSize(
      28.00,
    ),
  );

  static BorderRadius roundedBorder16 = BorderRadius.circular(
    getHorizontalSize(
      16.00,
    ),
  );

  static BorderRadius roundedBorder6 = BorderRadius.circular(
    getHorizontalSize(
      6.00,
    ),
  );

  static BorderRadius circleBorder13 = BorderRadius.circular(
    getHorizontalSize(
      13.00,
    ),
  );

  static BorderRadius roundedBorder34 = BorderRadius.circular(
    getHorizontalSize(
      34.00,
    ),
  );

  static BorderRadius roundedBorder3 = BorderRadius.circular(
    getHorizontalSize(
      3.00,
    ),
  );

  static BorderRadius roundedBorder10 = BorderRadius.circular(
    getHorizontalSize(
      10.00,
    ),
  );

  static BorderRadius roundedBorder40 = BorderRadius.circular(
    getHorizontalSize(
      40.00,
    ),
  );

  static BorderRadius txtRoundedBorder4 = BorderRadius.circular(
    getHorizontalSize(
      4.00,
    ),
  );
}
