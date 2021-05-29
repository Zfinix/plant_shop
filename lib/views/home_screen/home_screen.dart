import 'dart:ui' as ui;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_shop/utils/extensions.dart';
import 'package:plant_shop/utils/theme.dart';
import 'package:plant_shop/views/home_screen/widgets/plant_app_bar/plant_app_bar.dart';
import 'package:plant_shop/views/home_screen/widgets/plant_tab_bar/plant_tab_bar.dart';
import 'package:plant_shop/widgets/plant_icon.dart';
import 'package:plant_shop/widgets/touchable_opacity.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = PageController(viewportFraction: 0.74);
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          /// Top Spacing
          Gap(64),

          /// Plant App bar
          PlantAppBar(),

          /// Spacing
          Gap(context.screenHeight(0.07)),

          /// Plant Tab bar
          PlantTabBar(),

          /// Spacing
          Gap(47),

          /// Fiter Icon
          PlantFilterIcon(),

          /// Spacing
          Gap(33),

          Container(
            height: context.screenHeight(0.52),
            child: PageView(
              controller: controller,
              scrollDirection: Axis.horizontal,
              onPageChanged: (i) {
                setState(() {
                  currentPage = i;
                });
              },
              children: [
                for (var i = 0; i < 3; i++)
                  PlantCard(
                      currentPage: i == currentPage,
                      onTap: () {
                        setState(() {
                          controller.animateToPage(
                            i,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.decelerate,
                          );
                        });
                      }),
              ],
            ),
          ),

          /// Spacing
          Gap(context.screenHeight(0.07)),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 29),
            child: Container(
              child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: WormEffect(
                    spacing: 15,
                    dotHeight: 6,
                    dotWidth: 6,
                    activeDotColor: kPlanGreen,
                    dotColor: Color(0xffC2C2C2)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PlantCard extends StatelessWidget {
  final bool currentPage;
  final VoidCallback? onTap;
  const PlantCard({
    Key? key,
    required this.currentPage,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TouchableOpacity(
          onTap: onTap,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 250),
            transform: Transform.scale(scale: currentPage ? 1 : 0.89).transform,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: -2,
                        right: -17,
                        child: Image.asset(
                          'shadow'.png,
                          width: 173,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        width: 261,
                        height: 450,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          width: 261,
                          height: 408,
                          child: Stack(
                            children: [
                              Container(
                                width: 261,
                                height: 408,
                                decoration:
                                    BoxDecoration(color: kPlanCardColor),
                              ),
                              Container(
                                child: Image.asset('plant_1'.png),
                                margin: EdgeInsets.only(
                                    left: 22, bottom: 16, top: 34),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 31,
                                  vertical: 40,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Gasteria Kyoryu',
                                      style: GoogleFonts.lato(
                                        fontSize: 21,
                                        color: black,
                                      ),
                                    ),
                                    Gap(7),
                                    Text(
                                      'w 300 × h 310 mm'.allInCaps,
                                      style: GoogleFonts.lato(
                                          fontSize: 8,
                                          color: Color(0xFF737373),
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 31,
                                    bottom: 17,
                                  ),
                                  child: Text(
                                    '\$228.00',
                                    style: GoogleFonts.lato(
                                      fontSize: 18,
                                      color: black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: -17,
                                right: -16,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    width: 82,
                                    height: 87,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [
                                          Color(0xff1DA154),
                                          Color(0xff28CA6B),
                                        ],
                                      ),
                                    ),
                                    padding: EdgeInsets.all(20),
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      alignment: Alignment.topLeft,
                                      child: SvgPicture.asset(
                                        'plus_icon'.svg,
                                        height: 15,
                                        width: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class PlantFilterIcon extends StatelessWidget {
  const PlantFilterIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 27),
        child: PlantIcons(icon: 'filter_icon'),
      ),
    );
  }
}
