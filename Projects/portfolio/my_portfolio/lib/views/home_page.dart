library animate_do;

import 'package:flutter/material.dart';
import 'package:my_portfolio/globals/app_button.dart';
import 'package:my_portfolio/globals/app_color.dart';
import 'package:my_portfolio/globals/app_text_styles.dart';
import 'package:my_portfolio/globals/app_assets.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:animate_do/animate_do.dart';
import 'package:my_portfolio/helper%20class/helper_class.dart';
import 'package:my_portfolio/widget/profile_animation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final social = <String>[
    AppAsset.facebook,
    AppAsset.git,
    AppAsset.link,
    AppAsset.insta,
    AppAsset.twit,
  ];
  var socialBI;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Helper(
      mobile: Column(
        children: [
          buildHome(size),
          const SizedBox(
            height: 25,
          ),
          const Expanded(child: ProAnimate()),
        ],
      ),
      tablet: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(child: buildHome(size)),
          const Expanded(
            child: ProAnimate(),
          ),
        ],
      ),
      desktop: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(child: buildHome(size)),
          const Expanded(
            child: ProAnimate(),
          ),
        ],
      ),
      paddingWidth: size.width * 0.1,
      bgColor: AppColors.bgColor,
    );
  }

  Column buildHome(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        FadeInDown(
          duration: const Duration(milliseconds: 1400),
          child: Text(
            'Hello,It\'s Me',
            style: AppTextStyles.monStyle(color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 7,
        ),
        FadeInRight(
          child: Text(
            'Md. Mainul Islam',
            style: AppTextStyles.poppins(),
          ),
        ),
        const SizedBox(
          height: 7,
        ),
        //Contents.sizedBox(height: 15),
        FadeInLeft(
          duration: const Duration(milliseconds: 1400),
          child: Row(
            children: [
              Text(
                'And I\'m ',
                style: AppTextStyles.monStyle(color: Colors.white),
              ),
              AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText('Flutter Developer',
                      textStyle:
                          AppTextStyles.monStyle(color: Colors.lightBlue),
                      speed: const Duration(milliseconds: 100)),
                  TyperAnimatedText('Android App Developer',
                      textStyle:
                          AppTextStyles.monStyle(color: Colors.lightBlue),
                      speed: const Duration(milliseconds: 100)),
                ],
                pause: const Duration(milliseconds: 5000),
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        FadeInDown(
          duration: const Duration(milliseconds: 1600),
          child: SizedBox(
            width: size.width * 0.5,
            child: Expanded(
              child: Text(
                'I am a dedicated Flutter developer with a passion for creating elegant and efficient solutions. '
                'My commitment to writing clean and well-structured code reflects my unwavering work ethic.',
                style: AppTextStyles.normalStyle(),
                maxLines: 3, // Set the maximum number of lines
                // Specify how to handle overflow
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 22,
        ),
        FadeInUp(
            duration: const Duration(milliseconds: 1600),
            child: SizedBox(
              height: 48,
              child: ListView.separated(
                itemCount: social.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, child) => const SizedBox(
                  width: 8,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    onHover: (value) {
                      setState(() {
                        if (value) {
                          socialBI = index;
                        } else {
                          socialBI = null;
                        }
                      });
                    },
                    borderRadius: BorderRadius.circular(550.0),
                    hoverColor: AppColors.themeColor,
                    splashColor: AppColors.lawgreen,
                    child: buildSocialButton(
                        assest: social[index],
                        hover: socialBI == index ? true : false),
                  );
                },
              ),
            )),
        const SizedBox(
          height: 18,
        ),
        FadeInUp(
          duration: const Duration(milliseconds: 1800),
          child: AppButton.buildMaterialButton(
              onTap: () {}, buttonName: 'Download CV'),
        ),
      ],
    );
  }

  Ink buildSocialButton({required String assest, required bool hover}) {
    return Ink(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.bgColor, width: 2.0),
        color: AppColors.bgColor,
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(6),
      child: Image.asset(
        assest,
        width: 10,
        height: 12,
        color: hover ? AppColors.bgColor : AppColors.themeColor,
        //fit: BoxFit.fill,
      ),
    );
  }
}
