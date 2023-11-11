import 'package:flutter/material.dart';
import 'package:my_portfolio/globals/app_assets.dart';
import 'package:my_portfolio/globals/app_button.dart';
import 'package:my_portfolio/globals/app_color.dart';
import 'package:animate_do/animate_do.dart';
import 'package:my_portfolio/globals/app_text_styles.dart';
import 'package:my_portfolio/helper%20class/helper_class.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Helper(
      mobile: Column(
        children: [
          buildMethod(),
          const SizedBox(
            width: 25,
          ),
          buildProfile(),
          const SizedBox(
            width: 25,
          ),
        ],
      ),
      tablet: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildMethod(),
          const SizedBox(
            width: 25,
          ),
          buildProfile(),
        ],
      ),
      desktop: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildProfile(),
          const SizedBox(
            width: 25,
          ),
          buildMethod(),
        ],
      ),
      paddingWidth: size.width * 0.1,
      bgColor: AppColors.bgColor2,
    );
  }

  FadeInRight buildProfile() {
    return FadeInRight(
      duration: const Duration(milliseconds: 1200),
      child: Image.asset(
        AppAsset.mainul,
        height: 450,
        width: 400,
        //alignment: Alignment.center,
      ),
    );
  }

  Expanded buildMethod() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInRight(
            child: RichText(
              text: TextSpan(
                text: 'About',
                style: AppTextStyles.headingTextStyle(fontSize: 30),
                children: [
                  TextSpan(
                    text: 'Me',
                    style: AppTextStyles.headingTextStyle(
                      fontSize: 30,
                      color: AppColors.robinEdgeBlue,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          FadeInDown(
            child: Text(
              'Flutter Developer!',
              style: AppTextStyles.monStyle(color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          FadeInLeft(
            child: Text(
              'Android developer with 1 year\'s experience '
              'crafting top-tier apps in Java and Dart. Firm '
              'grasp of Android SDK and Material Design.'
              'User-focused, I prioritize clean code, app '
              'performance, and seamless functionality: I am '
              'an active learner, open-source contributor, and '
              'team player.',

              style: AppTextStyles.normalStyle(),
              maxLines: 3, // Set the maximum number of lines
              // Specify how to handle overflow
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          FadeInUp(
              duration: const Duration(milliseconds: 1600),
              child: AppButton.buildMaterialButton(
                  onTap: () {}, buttonName: 'Read More')),
        ],
      ),
    );
  }
}
