import 'package:flutter/material.dart';
import 'package:my_portfolio/globals/app_color.dart';
// ignore: unused_import
import 'package:cupertino_icons/cupertino_icons.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      color: AppColors.bgColor2,
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () {},
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.themeColor,
          ),
          child: const Icon(
            Icons.arrow_upward,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
