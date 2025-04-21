import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stackwealth_news/core/utils/app_utils.dart';
import 'package:stackwealth_news/core/utils/color_constant.dart';
import 'package:stackwealth_news/core/utils/size_utils.dart';
import 'package:stackwealth_news/features/home/presentation/screens/news_screen.dart';
import 'package:stackwealth_news/gen/assets.gen.dart';
import 'package:stackwealth_news/widgets/custom_image_view.dart';
import 'package:velocity_x/velocity_x.dart';

class SplashScreen extends StatelessWidget {
  static const route = '/splashScreen';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: buildContainerdecoration(),
      child: SafeArea(
        bottom: false,
        top: handleSafeArea(),
        child: Scaffold(
          backgroundColor: ColorConstant.whiteA700,
          body: AnimatedSplashScreen(
            splash: ClipRRect(
              borderRadius: BorderRadius.circular(70),
              child: Image.asset(
                // scale: 3,
                Assets.images.logo.path,
                fit: BoxFit.contain,
                height: getSize(400),
                width: getSize(400),
              ),
            ),
            backgroundColor: ColorConstant.whiteA700,
            duration: 3000,
            splashTransition: SplashTransition.fadeTransition,
            pageTransitionType: PageTransitionType.fade,
            nextScreen: const NewsScreen(),
          ),

          // FadeIn(
          //   duration: Duration(seconds: controller.duration),
          //   child: CustomImageView(
          //     svgPath: Assets.images.svgLogoOrange,
          //   ),
          // ).centered(),
        ),
      ),
    );
  }
}

class BuildImage extends StatelessWidget {
  const BuildImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomImageView(
        radius: BorderRadius.circular(70),
        imagePath: Assets.images.logo.path,
        height: getSize(400),
        width: getSize(400),
      ).centered(),
    );
  }
}
