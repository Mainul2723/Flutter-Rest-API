// ignore_for_file: unused_import, duplicate_ignore

import 'dart:html';

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:my_portfolio/globals/app_assets.dart';
import 'package:my_portfolio/globals/app_color.dart';
import 'package:my_portfolio/globals/app_text_styles.dart';
import 'package:my_portfolio/views/about_me.dart';
import 'package:my_portfolio/views/contact_me.dart';
import 'package:my_portfolio/views/home_page.dart';
import 'package:my_portfolio/views/my_projects.dart';

class MainDashboard extends StatefulWidget {
  const MainDashboard({super.key});

  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  final isMenuHover = Matrix4.identity()..scale(1.0);
  final menuItems = <String>[
    'Home',
    'About',
    'Projects',
    'Contact',
  ];

  final yourScrollController = ScrollController();

  var menuIndex = 0;
  final screen = const <Widget>[
    HomePage(),
    AboutMe(),
    MyServices(),
    ContactMe(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        toolbarHeight: 90,
        titleSpacing: 40,
        elevation: 0,
        title: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 768) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Portfolio', style: AppTextStyles.headingTextStyle()),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.menu_sharp,
                      size: 32,
                      color: Colors.white,
                    ),
                    color: Colors.white,
                  ),
                ],
              );
            } else {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Portfolio', style: AppTextStyles.headingTextStyle()),
                  const Spacer(),
                  SizedBox(
                    height: 30,
                    child: ListView.separated(
                      itemCount: menuItems.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 10,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(100),
                          onHover: (value) {
                            setState(() {
                              if (value) {
                                menuIndex = index;
                              } else {
                                menuIndex = 0;
                              }
                            });
                          },
                          child: Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: buildAnimatedContainer(
                                index, menuIndex == index ? true : false),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                ],
              );
            }
          },
        ),
      ),
      body: screen[menuIndex],
    );
  }

  AnimatedContainer buildAnimatedContainer(int index, bool hover) {
    return AnimatedContainer(
      alignment: Alignment.center,
      width: hover ? 80 : 75,
      duration: const Duration(milliseconds: 200),
      transform: hover ? isMenuHover : null,
      child: Center(
        // Center the text within the container
        child: Text(
          menuItems[index],
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.headingTextStyle(
            color: hover ? AppColors.themeColor : Colors.white,
          ),
        ),
      ),
    );
  }
}
