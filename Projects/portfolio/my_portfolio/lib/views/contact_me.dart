import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:my_portfolio/globals/app_button.dart';
import 'package:my_portfolio/globals/app_color.dart';
import 'package:my_portfolio/globals/app_text_styles.dart';

class ContactMe extends StatelessWidget {
  const ContactMe({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      color: AppColors.bgColor,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: size.width * 0.2),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            FadeInDown(
              duration: const Duration(milliseconds: 1200),
              child: RichText(
                text: TextSpan(
                  text: 'Contact',
                  style: AppTextStyles.headingTextStyle(fontSize: 30),
                  children: [
                    TextSpan(
                      text: 'Me!',
                      style: AppTextStyles.headingTextStyle(
                          fontSize: 30, color: AppColors.robinEdgeBlue),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Expanded(
                  child: Material(
                    borderRadius: BorderRadius.circular(12),
                    elevation: 8,
                    color: Colors.transparent,
                    child: TextField(
                      cursorColor: Colors.white,
                      style: AppTextStyles.normalStyle(),
                      decoration: buildInputDecoration(hintText: 'Full Name'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Material(
                    borderRadius: BorderRadius.circular(12),
                    elevation: 8,
                    color: Colors.transparent,
                    child: TextField(
                      cursorColor: Colors.white,
                      style: AppTextStyles.normalStyle(),
                      decoration:
                          buildInputDecoration(hintText: 'Email Address'),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Material(
                    borderRadius: BorderRadius.circular(12),
                    elevation: 8,
                    color: Colors.transparent,
                    child: TextField(
                      cursorColor: Colors.white,
                      style: AppTextStyles.normalStyle(),
                      decoration:
                          buildInputDecoration(hintText: 'Mobile Number'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Material(
                    borderRadius: BorderRadius.circular(12),
                    elevation: 8,
                    color: Colors.transparent,
                    child: TextField(
                      cursorColor: Colors.white,
                      style: AppTextStyles.normalStyle(),
                      decoration:
                          buildInputDecoration(hintText: 'Email Subject'),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Material(
                    borderRadius: BorderRadius.circular(12),
                    elevation: 8,
                    color: Colors.transparent,
                    child: TextField(
                      maxLines: 10,
                      cursorColor: Colors.white,
                      style: AppTextStyles.normalStyle(),
                      decoration: buildInputDecoration(
                        hintText: 'Your Message',
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            AppButton.buildMaterialButton(
                buttonName: 'Send Message', onTap: () {})
          ]),
    );
  }

  InputDecoration buildInputDecoration({required String hintText}) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: AppTextStyles.headingTextStyle(color: Colors.blueGrey),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      filled: true,
      fillColor: AppColors.bgColor,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    );
  }
}
