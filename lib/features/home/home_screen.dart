import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/core/styles/app_colors.dart';
import 'package:meals_app/core/styles/app_text_styles.dart';
import 'package:meals_app/features/home/widgets/custom_food_item.dart';
import 'package:meals_app/features/home/widgets/cutom_top_home_part.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const routeName = 'HomeScreen';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTopHomePart(),
            SizedBox(height: 25.h),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 8.sp),
                      child: Text('Your Food', style: TextStyles.black16Madium),
                    ),
                    SizedBox(height: 25.h),
                    Expanded(
                      child: GridView.builder(
                        itemCount: 30,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 22.sp,
                          crossAxisSpacing: 16.sp,
                          childAspectRatio: 0.9,
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) {
                          return CustomFoodItem(
                            onTap: (){},
                            imageUrl: 'assets/images/food.png',
                            name: 'Burger',
                            rate: 4.9,
                            time: '20-30',
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          shape: CircleBorder(),
          backgroundColor: AppColors.primaryColor,
          child: Icon(Icons.add,
          color: Colors.white,
          size: 30.sp,
          ),
          onPressed: (){},
          ),
          
      ),
    );
  }
}
