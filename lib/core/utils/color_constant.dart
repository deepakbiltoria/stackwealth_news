import 'package:flutter/material.dart';

class ColorConstant {
  static Color gray5001 = fromHex('#f2f2f2'); // soft white/gray

  static Color purpleA200 = fromHex('#9a6eff');
  static Color purpleA300 = fromHex('#7c4dff');

  static Color slate80002 = fromHex('#4a4a58');

  static Color slate80001 = fromHex('#40404d');

  static Color black9003f = fromHex('#3f000000');

  static Color gray700 = fromHex('#616161');

  static Color gray500 = fromHex('#9e9e9e');

  static Color purpleShadowA20051 = fromHex('#51694dff');

  static Color purpleShadow70051 = fromHex('#517c4dff');

  static Color purpleLightA20001 = fromHex('#517C4DFF');

  static Color purpleLight700 = fromHex('#51694DFF');

  static Color black90001 = fromHex('#020202');

  static Color deepPurpleA700 = fromHex('#6200ea');

  static Color black90000 = fromHex('#00000000');

  static Color graySlate600 = fromHex('#6e6e73');

  static Color gray5090 = fromHex('#90f2f2f2');

  static Color slate90001 = fromHex('#2f2f3f');

  static Color slate900 = fromHex('#303040');

  static Color slate600 = fromHex('#707080');

  static Color purple900 = fromHex('#4b0082');

  static Color slateGreen7003f = fromHex('#3f4c4c5c');

  // static Color purpleA200 = fromHex('#9a6eff');

  static Color slateGray100 = fromHex('#d3d3db');

  static Color black9008c = fromHex('#8c000000');

  static Color slate800 = fromHex('#3d3d4d');

  static Color slate500 = fromHex('#686878');

  static Color purpleA20001 = fromHex('#9a6eff');

  static Color purpleA20002 = fromHex('#a277ff');

  static Color gray200 = fromHex('#e7e7e7');

  static Color gray400 = fromHex('#888888');

  static Color slate40002 = fromHex('#8d8d9d');

  static Color slate40001 = fromHex('#8b8b9b');

  static Color whiteA700 = fromHex('#ffffff');

  static Color purple50 = fromHex('#f3e5f5');

  static Color slateGray100bg = fromHex('#eeeeee');

  static Color gray600 = fromHex('#757575');

  static Color gray50 = fromHex('#f8f8fc');

  static Color slate3000f = fromHex('#0f6e6e7e');

  static Color black900 = fromHex('#000000');

  static Color gray50001 = fromHex('#9a9ba2');

  static Color purple90001 = fromHex('#4c0080');

  static Color gray50003 = fromHex('#9e9e9e');

  static Color gray50002 = fromHex('#909090');

  static Color gray90002 = fromHex('#292930');

  static Color purple90002 = fromHex('#4d007f');

  static Color gray90003 = fromHex('#1f1f2f');

  static Color gray700Alt = fromHex('#6a6a7a');

  static Color gray60002 = fromHex('#747484');

  static Color gray500Alt = fromHex('#a1a0af');

  static Color gray60001 = fromHex('#6f6f7f');

  static Color slate400 = fromHex('#868899');

  static Color purple400 = fromHex('#b39ddb');

  static Color purple50Alt = fromHex('#e3e0ec');

  static Color purple90003 = fromHex('#4e0082');

  static Color gray900 = fromHex('#111122');

  static Color gray90001 = fromHex('#2a2a3a');

  static Color purple90004 = fromHex('#4f0083');

  static Color purple700 = fromHex('#7b1fa2');

  static Color gray300 = fromHex('#dadada');

  static Color gray30001 = fromHex('#dddddd');

  static Color gray100 = fromHex('#f4f4f9');

  static Color purple100 = fromHex('#e1bee7');

  static Color purple90005 = fromHex('#4d0082');

  static const Color deepPurplePrimary = Color(0xFF5E3B76); // Adjust as needed
  static const Color slateGray500 = Color(0xFF64748B); // Subtle accent

  static const MaterialColor neutralThemeSwatch = MaterialColor(
    0xFF5E3B76,
    <int, Color>{
      50: Color.fromRGBO(94, 59, 118, .1),
      100: Color.fromRGBO(94, 59, 118, .2),
      200: Color.fromRGBO(94, 59, 118, .3),
      300: Color.fromRGBO(94, 59, 118, .4),
      400: Color.fromRGBO(94, 59, 118, .5),
      500: Color.fromRGBO(94, 59, 118, .6),
      600: Color.fromRGBO(94, 59, 118, .7),
      700: Color.fromRGBO(94, 59, 118, .8),
      800: Color.fromRGBO(94, 59, 118, .9),
      900: Color.fromRGBO(94, 59, 118, 1),
    },
  );

  static final rgbColor = [102, 51, 153];
  static final themeColor = Color(0xff663399);
  static final Map<int, Color> themeMapColor = {
    50: Color.fromRGBO(rgbColor[0], rgbColor[1], rgbColor[2], .1),
    100: Color.fromRGBO(rgbColor[0], rgbColor[1], rgbColor[2], .2),
    200: Color.fromRGBO(rgbColor[0], rgbColor[1], rgbColor[2], .3),
    300: Color.fromRGBO(rgbColor[0], rgbColor[1], rgbColor[2], .4),
    400: Color.fromRGBO(rgbColor[0], rgbColor[1], rgbColor[2], .5),
    500: Color.fromRGBO(rgbColor[0], rgbColor[1], rgbColor[2], .6),
    600: Color.fromRGBO(rgbColor[0], rgbColor[1], rgbColor[2], .7),
    700: Color.fromRGBO(rgbColor[0], rgbColor[1], rgbColor[2], .8),
    800: Color.fromRGBO(rgbColor[0], rgbColor[1], rgbColor[2], .9),
    900: Color.fromRGBO(rgbColor[0], rgbColor[1], rgbColor[2], 1),
  };

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  static Color blueA200 = fromHex('#4b7dff');
  static Color blueA300 = fromHex('#007df2');

  static Color gray80002 = fromHex('#4d4d4d');

  static Color gray80001 = fromHex('#404040');

  static Color green700 = fromHex('#1abb00');

  static Color green500 = fromHex('#61b04c');

  static Color orangeA20051 = fromHex('#51ff9e4c');

  static Color orange70051 = fromHex('#51ff7a0a');

  static Color orangeLightA20001 = fromHex('#51FF7A0A');

  static Color orangeLight700 = fromHex('#51FF9E4C');

  static Color greenA700 = fromHex('#00a341');

  static Color lightGreen600 = fromHex('#68b04c');

  static Color blueGray90001 = fromHex('#263238');

  static Color blueGray900 = fromHex('#303030');

  static Color amber900 = fromHex('#ff7400');

  static Color lightGreenA7003f = fromHex('#3f6bc51c');

  static Color orangeA200 = fromHex('#ff9f4f');

  static Color blueGray100 = fromHex('#d9d9d9');

  static Color gray800 = fromHex('#3d3d3d');

  static Color blueGray500 = fromHex('#64748b');

  static Color orangeA20001 = fromHex('#ff9e4c');

  static Color orangeA20002 = fromHex('#ff9338');

  static Color bluegray400 = fromHex('#888888');

  static Color blueGray40002 = fromHex('#8d8d8d');

  static Color blueGray40001 = fromHex('#8b8b8b');

  static Color deepOrange50 = fromHex('#ffefe7');

  static Color lightGreen100 = fromHex('#dfeed7');

  static Color green600 = fromHex('#28ae5c');

  static Color blueGray3000f = fromHex('#0f94a3b8');

  static Color yellow900 = fromHex('#ff7b0c');

  static Color amber90001 = fromHex('#ff7807');

  static Color blueGray400 = fromHex('#868889');

  static Color amber400 = fromHex('#fcc81a');

  static Color indigo50 = fromHex('#e3e8fc');
  static Color indigoA200 = Colors.blueAccent;

  static Color amber90002 = fromHex('#ff7908');

  static Color amber90003 = fromHex('#ff7909');

  static Color orange700 = fromHex('#ff7a0a');

  static Color orange100 = fromHex('#ffdbbe');

  static Color yellow90002 = fromHex('#ff7c0d');

  static Color yellow90001 = fromHex('#ff7e11');

  static Color orange50 = fromHex('#fff4e2');

  static Color yellow90004 = fromHex('#ff7b0d');

  static Color yellow90003 = fromHex('#ff7d0e');

  static Color orange70001 = fromHex('#ff7a09');

  // static final rgbColor = [255, 116, 0];
  // static final themeColor = Color(0xffff7400);
  // static final Map<int, Color> themeMapColor = {
  //   50: Color.fromRGBO(rgbColor[0], rgbColor[1], rgbColor[2], .1),
  //   100: Color.fromRGBO(rgbColor[0], rgbColor[1], rgbColor[2], .2),
  //   200: Color.fromRGBO(rgbColor[0], rgbColor[1], rgbColor[2], .3),
  //   300: Color.fromRGBO(rgbColor[0], rgbColor[1], rgbColor[2], .4),
  //   400: Color.fromRGBO(rgbColor[0], rgbColor[1], rgbColor[2], .5),
  //   500: Color.fromRGBO(rgbColor[0], rgbColor[1], rgbColor[2], .6),
  //   600: Color.fromRGBO(rgbColor[0], rgbColor[1], rgbColor[2], .7),
  //   700: Color.fromRGBO(rgbColor[0], rgbColor[1], rgbColor[2], .8),
  //   800: Color.fromRGBO(rgbColor[0], rgbColor[1], rgbColor[2], .9),
  //   900: Color.fromRGBO(rgbColor[0], rgbColor[1], rgbColor[2], 1),
  // };
  //
  // static Color fromHex(String hexString) {
  //   final buffer = StringBuffer();
  //   if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  //   buffer.write(hexString.replaceFirst('#', ''));
  //   return Color(int.parse(buffer.toString(), radix: 16));
  // }
}
