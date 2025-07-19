import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/core/styles/app_colors.dart';
import 'package:meals_app/core/styles/app_text_styles.dart';



class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});
  static const routeName = 'onBoardingScreen';
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<String> titles = [
    'Save Your Meals Ingredient',
    'Use Our App The Best Choice',
    ' Our App Your Ultimate Choice',
  ];
  List<String> descriptions = [
    'Add Your Meals and its Ingredients and we will save it for you',
    'the best choice for your kitchen do not hesitate',
    'All the best restaurants and their top menus are ready for you',
  ];
  int currentIndex = 0;
  CarouselSliderController controller = CarouselSliderController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/onbording.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            bottom: 16.h,
            right: 32.w,
            left: 32.w,
            child: Container(
              width: 311.w,
              height: 400.h,
              padding: EdgeInsets.all(32.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(48.r),
                color: AppColors.primaryColor.withOpacity(0.9),
              ),
              child: Column(
                children: [
                  CarouselSlider(
                    carouselController: controller,
                    options: CarouselOptions(
                      onPageChanged: (index, reason) {
                        currentIndex = index;
                        setState(() {});
                      },
                      height: 250.h,
                      enlargeCenterPage: true,
                      viewportFraction: 0.9,
                    ),
                    items: List.generate(titles.length, (index) {
                      return Builder(
                        builder: (BuildContext context) {
                          return SizedBox(
                            width: 252.w,
                            child: Column(
                              children: [
                                Text(
                                  titles[index],
                                  textAlign: TextAlign.center,
                                  style: TextStyles.onBoardingTitleStyle,
                                ),
                                SizedBox(height: 16.h),
                                Text(
                                  descriptions[index],
                                  textAlign: TextAlign.center,
                                  style: TextStyles.onBoardingDescriptionStyle,
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }),
                  ),
                  SizedBox(height: 5.h),
                  DotsIndicator(
                    dotsCount: 3,
                    position: currentIndex.toDouble(),
                    decorator: DotsDecorator(
                      size: Size(24, 6),
                      activeSize: const Size(24, 6),
                      color: Color(0xFFC2C2C2),
                      activeColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onTap: (index) {
                      controller.animateToPage(index);
                      currentIndex = index;
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
